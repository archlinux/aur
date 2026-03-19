# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=taurus_pyqtgraph
pkgname=python-taurus-pyqtgraph
pkgver=0.9.8
pkgrel=1
pkgdesc="Taurus extension providing pyqtgraph-based widgets"
arch=("any")
url="https://gitlab.com/taurus-org/${_name}"
license=("CC-BY-3.0")
depends=(python python-pyqtgraph python-taurus python-pyqt5-datavisualization python-click python-numpy)
optdepends=("python-pyhdbpp: Plotting data from the HDB++ archiver")
makedepends=(python-build python-installer)
source=("${_name}-${pkgver}.tar.gz::https://gitlab.com/taurus-org/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=("9b3f347390e0a5ee5526c9d45df0b6af85e41a2b49e4df365dda00716a6d72df")

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
