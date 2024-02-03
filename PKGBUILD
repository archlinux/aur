# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=taurus_pyqtgraph
pkgname=python-taurus-pyqtgraph
pkgver=0.8.0
pkgrel=1
pkgdesc="Taurus extension providing pyqtgraph-based widgets"
arch=('any')
url="https://gitlab.com/taurus-org/${_name}"
license=('LGPL3')
depends=(python-pyqtgraph python-taurus python-pyqt5-datavisualization)
optdepends=('python-pyhdbpp: Plotting data from the HDB++ archiver')
makedepends=(python-build python-installer)
source=("${_name}-${pkgver}.tar.gz::https://gitlab.com/taurus-org/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=("5202496ff6f7305eab21053d8811de729b5046d2fe2aa085c085f328328d96d7")

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
