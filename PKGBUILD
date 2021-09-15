# Maintainer: chn <g897331845@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Alexander Susha <isushik94@gmail.com>

pkgname=xtensor-python
pkgver=0.25.3
pkgrel=1
pkgdesc="QuantStack tools library - Multi-dimensional arrays with broadcasting and lazy computing."
arch=('x86_64')
url="https://github.com/QuantStack/${pkgname}"
license=('BSD-3-Clause')
depends=('xtensor' 'xtl' 'pybind11' 'python-numpy')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QuantStack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('6991841f446459b2716314ebe1cbc5f638a2e7b4ee5e5c5b916930467ebfac38b6a4af6356b4e07d861c9b0a4de3720ed14746729fbec27caad7216a98c3c834')

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
