# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=blasfeo
pkgver=0.1.1
pkgdesc="Basic linear algebra subroutines for embedded optimization"
url='https://github.com/giaf/blasfeo'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD 2-Clause')
makedepends=('cmake')
depends=()
source=(https://github.com/giaf/blasfeo/archive/${pkgver}.tar.gz)
sha256sums=('a52169306dfcc43d0aa41b031b98f1d63a4fd0ec7e8139bf95f14dc270ec3b72')

build() {
  mkdir -p ${srcdir}/${pkgname}-${pkgver}/build
  cd ${srcdir}/${pkgname}-${pkgver}/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DCMAKE_BUILD_TYPE="Release"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}/" install
}
