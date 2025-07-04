# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=taurus_pyqtgraph
pkgname=python-taurus-pyqtgraph
pkgver=0.9.7
pkgrel=1
pkgdesc="Taurus extension providing pyqtgraph-based widgets"
arch=("any")
url="https://gitlab.com/taurus-org/${_name}"
license=("CC-BY-3.0")
depends=(python python-pyqtgraph python-taurus python-pyqt5-datavisualization python-click python-numpy)
optdepends=("python-pyhdbpp: Plotting data from the HDB++ archiver")
makedepends=(python-build python-installer)
source=("${_name}-${pkgver}.tar.gz::https://gitlab.com/taurus-org/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=("1242e72c35cb8147be72e65763bda565a13305181464e4c5acd41a5241f071a1")

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
