# Maintainer: chn <g897331845@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Alexander Susha <isushik94@gmail.com>

pkgname=xtensor-python
pkgver=0.25.1
pkgrel=1
pkgdesc="QuantStack tools library - Multi-dimensional arrays with broadcasting and lazy computing."
arch=('x86_64')
url="https://github.com/QuantStack/${pkgname}"
license=('BSD-3-Clause')
depends=('xtensor' 'xtl' 'pybind11' 'python-numpy')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QuantStack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('4eac75fc0a16f55b019748a108750fd3229e6b5f3a38df87c7f93ff2c4114e1e62fe5c5065b93a9d4c68dbaf33a222a06561bbd0fb476879fe5ab4b82c6e68a4')

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
