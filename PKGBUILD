# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=hpipm
pkgver=0.1.2
pkgdesc="High-performance interior-point-method QP solvers"
url='https://github.com/giaf/hpipm'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD 2-Clause')
makedepends=('cmake')
depends=('blasfeo')
source=("${pkgname}-${pkgver}::https://github.com/giaf/hpipm/archive/${pkgver}.tar.gz")
sha256sums=('ee0aba9ca906f2d5dea018f3d9ca9d2fca93e3f2490a1f1df8f92e734f8410ff')

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
