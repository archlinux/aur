# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=hpipm
pkgver=0.1.1
pkgdesc="High-performance interior-point-method QP solvers"
url='https://github.com/giaf/hpipm'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD 2-Clause')
makedepends=('cmake')
depends=('blasfeo')
source=(https://github.com/giaf/hpipm/archive/${pkgver}.tar.gz)
sha256sums=('2e9142ade463159a098f523d1292eb1171dabbf6a2fddfd656d16d132c3eb595')

build() {
  mkdir -p ${srcdir}/${pkgname}-${pkgver}/build
  cd ${srcdir}/${pkgname}-${pkgver}/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE="Release"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}/" install
}
