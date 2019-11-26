# Maintainer: Alexander Susha <isushik94@gmail.com>
# Contributor: Fredrik Tegenfeldt <tegenf@gmail.com>
pkgname=xsimd
pkgver=7.4.2
pkgrel=1
pkgdesc="QuantStack tools library - Multi-dimensional arrays with broadcasting and lazy computing."
arch=('x86_64')
url="https://github.com/QuantStack/${pkgname}"
license=('BSD-3-Clause')
depends=()
makedepends=('cmake' 'gtest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QuantStack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('3ca054205e7b1b4efb88d76de0cbf9a8ff0d111ce8debbf6c3dac764c602c04c3bf7aeb46ccc842d3ca542fc38e90d19c567fadf503e436e3f8ddf1e19b8ced3')

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
