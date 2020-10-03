# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=matplotplusplus
pkgver=1.0.1
pkgrel=1
pkgdesc="Matplot++: A C++ Graphics Library for Data Visualization"
url="https://alandefreitas.github.io/matplotplusplus/"
arch=(x86_64)
license=('MIT')
makedepends=(cmake)
depends=(gnuplot)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alandefreitas/matplotplusplus/archive/v$pkgver.tar.gz")
sha256sums=("19f5f6fe40b56efc49dcda7f6c6de07679f5707254dea6859c3c7b4a8a0759a3")

build() {
  mkdir -p "$srcdir/${pkgname}-${pkgver}/build"
  cd "$srcdir/${pkgname}-${pkgver}/build"
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_TESTS=OFF \
        ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESDIR=${pkgdir} install
}
