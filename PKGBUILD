# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=kover
pkgver=6
pkgrel=2
pkgdesc="easy to use WYSIWYG CD cover printer with CDDB and CDTEXT support"
arch=('i686' 'x86_64')
url="http://lisas.de/kover/"
license=('GPL2')
depends=('kdebase-runtime' 'libcdio')
makedepends=('pkgconfig' 'cmake' 'automoc4')
install=kover.install
source=(https://lisas.de/kover/${pkgname}-${pkgver}.tar.bz2)
md5sums=('9504afd8a779c54d7c77fb28d7b5c76e')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=$pkgdir install
}
