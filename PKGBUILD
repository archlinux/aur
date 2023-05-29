# Maintainer: lekcyjna <kubanekmlodszy at interia dot pl>
# Contributor: chn <g897331845@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Alexander Susha <isushik94@gmail.com>

pkgname=xtensor-python
pkgver=0.26.1
pkgrel=1
pkgdesc="Bindings for xtensor and python-numpy"
arch=('x86_64')
url="https://github.com/xtensor-stack/${pkgname}"
license=('BSD-3-Clause')
depends=('xtensor>=0.24.0' 'xtl' 'pybind11' 'python-numpy')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xtensor-stack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('62ac0a22db77b302c33b75b9153596642474f326c7efe02f3b89fcaf61b89977bb999fd5055788db6cd51181157e2bfef25af25853fc767f0192e1d347c97265')

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
