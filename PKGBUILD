# Contributor: Nathan Owe <ndowens.aur at gmail.com>
pkgname=freebsd-atom
pkgver=1.0
pkgrel=6
pkgdesc="Converts text files to html with special attrs"
arch=('i686' 'x86_64')
url="http://www.freebsd.org/cgi/url.cgi?ports/textproc/atom/pkg-descr"
license=('GPL2')
depends=('glibc')
source=(http://www.bayofrum.net/dist/atom/atom-${pkgver}.tar.gz)
md5sums=('d437c8dad83173bf0001d70ca68ed4af') 

build() {
  cd ${srcdir}/atom-${pkgver}
  ./configure --prefix=/usr
  make 
}

package() {
  cd "${srcdir}/atom-${pkgver}"
  install -Dm 755 atom "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 atom.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
