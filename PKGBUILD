# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=taurus_pyqtgraph
pkgname=python-taurus-pyqtgraph
pkgver=0.9.3
pkgrel=1
pkgdesc="Taurus extension providing pyqtgraph-based widgets"
arch=('any')
url="https://gitlab.com/taurus-org/${_name}"
license=('LGPL3')
depends=(python-pyqtgraph python-taurus python-pyqt5-datavisualization)
optdepends=('python-pyhdbpp: Plotting data from the HDB++ archiver')
makedepends=(python-build python-installer)
source=("${_name}-${pkgver}.tar.gz::https://gitlab.com/taurus-org/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=("f27129ce2f1c01e33e156fcaf12d9a1057204f5d14ff381abf4a6eb0568c2099")

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
