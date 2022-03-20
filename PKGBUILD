# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=blasfeo
pkgver=0.1.3
pkgdesc="Basic linear algebra subroutines for embedded optimization"
url='https://github.com/giaf/blasfeo'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD 2-Clause')
makedepends=('cmake')
depends=()
source=(https://github.com/giaf/blasfeo/archive/${pkgver}.tar.gz)
sha256sums=('c33eb6467a90d6075a8db34e5ab239ecdda38c5261ae096def122fe7a0f98780')

build() {
  mkdir -p ${srcdir}/${pkgname}-${pkgver}/build
  cd ${srcdir}/${pkgname}-${pkgver}/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBLASFEO_EXAMPLES=OFF

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}/" install
}
