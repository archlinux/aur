# Maintainer: Andrew Whatson <whatson@gmail.com>
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: tantalum <tantalum at online dot de>
pkgname=guile-lib
pkgver=0.2.6.1
pkgrel=2
pkgdesc='Repository of useful code written in Guile Scheme'
arch=('i686' 'x86_64')
license=('GPL3' 'LGPL3')
depends=('guile')
url="http://www.nongnu.org/guile-lib/"
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('6d1d3d0f14db9d280b8d427d6e1dec4417ddd02bff23bd5982ecb6e262eb3f2a')

build() {
  cd ${pkgname}-${pkgver}
  GUILE=/usr/bin/guile ./configure --prefix=/usr --with-guile-site
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
