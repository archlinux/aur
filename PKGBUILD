# Maintainer: Alexander Susha <isushik94@gmail.com>
# Contributor: Fredrik Tegenfeldt <tegenf@gmail.com>
pkgname=xsimd
pkgver=7.4.10
pkgrel=1
pkgdesc="QuantStack tools library - Multi-dimensional arrays with broadcasting and lazy computing."
arch=("any")
url="https://github.com/QuantStack/${pkgname}"
license=('BSD-3-Clause')
depends=()
makedepends=('cmake' 'gtest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QuantStack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('830d983bb8b671043281ae92e789c40831f99f689a4b973ce20510f126bcf6df664e417569d1f654e843f2d420b55325d286ce095da820b40edbf2bce09b6ff3')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  [ ! -d build ] && mkdir build
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/build"
  make install
}
