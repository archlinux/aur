# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: tantalum <tantalum at online dot de>
pkgname=g-wrap
pkgver=1.9.14
pkgrel=2
pkgdesc='A tool and guile library, for generating function wrappers for inter-language calls'
arch=(i686 x86_64)
license=(LGPL)
depends=('glib2' 'guile-lib>=0.1.2')
url='http://www.nongnu.org/g-wrap/'
install=$pkgname.install
source=("http://savannah.nongnu.org/download/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=(fef7ec5e2ff5192221ed6e97fe93bcb9)

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-Werror
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -f "${pkgdir}/usr/share/info/dir"
}
