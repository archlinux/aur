# Maintainer: Alexander Susha <isushik94@gmail.com>
pkgname=xsimd
pkgver=6.1.6
pkgrel=1
pkgdesc="QuantStack tools library - Multi-dimensional arrays with broadcasting and lazy computing."
arch=('x86_64')
url="https://github.com/QuantStack/${pkgname}"
license=('BSD-3-Clause')
depends=()
makedepends=('cmake' 'gtest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QuantStack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('937d342d21a1543c9e2d9f0e3a2f0bcfa6209b589c7bf6e1c571de5e7680493bc106aea6b5d11bdcafc10d2d44e19d8445281436ca2c8a63de3dc3339ccddf44')

build() {
  cd "${pkgname}-${pkgver}"
  [ ! -d build ] && mkdir build
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make install
}
