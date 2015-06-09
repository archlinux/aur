# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: nbvcxz (b4283)

pkgname=l3afpad
pkgver=0.8.18.1.10
pkgrel=2
pkgdesc="Simple plain text editor for GTK3."
arch=('i686' 'x86_64')
url="http://www.calno.com/l3afpad/"
license=('GPL2')
depends=('gtk3' 'desktop-file-utils')
makedepends=('intltool')
install=l3afpad.install
source=(http://www.calno.com/l3afpad/${pkgname}-${pkgver}.tar.xz)
md5sums=('1f31e3fc19420384fa3be6cc4ee222d7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-nls --disable-maintainer-mode
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install-strip
}
