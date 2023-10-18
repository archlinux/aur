# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=taurus_pyqtgraph
pkgname=python-taurus-pyqtgraph
pkgver=0.7.0
pkgrel=1
pkgdesc="Taurus extension providing pyqtgraph-based widgets"
arch=('any')
url='http://taurus-scada.org/'
license=('LGPL3')
depends=(python-pyqtgraph python-taurus python-pyqt5-datavisualization)
optdepends=('python-pyhdbpp: Plotting data from the HDB++ archiver')
makedepends=(python-setuptools)
source=("${_name}-${pkgver}.tar.gz::https://gitlab.com/taurus-org/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('7a630975836e9979a295fc20b0eb87029cc6af7a2d9413cbd2a37ed88e9cd399')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
