# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=matplotplusplus
pkgver=1.1.0
pkgrel=1
pkgdesc="Matplot++: A C++ Graphics Library for Data Visualization"
url="https://alandefreitas.github.io/matplotplusplus/"
arch=(x86_64)
license=('MIT')
makedepends=(cmake)
depends=(gnuplot)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alandefreitas/matplotplusplus/archive/v$pkgver.tar.gz")
sha256sums=("5c3a1bdfee12f5c11fd194361040fe4760f57e334523ac125ec22b2cb03f27bb")

build() {
  mkdir -p "$srcdir/${pkgname}-${pkgver}/build"
  cd "$srcdir/${pkgname}-${pkgver}/build"
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_TESTS=OFF \
        ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESDIR=${pkgdir} install
}
