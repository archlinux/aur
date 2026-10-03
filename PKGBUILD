# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=taurus_pyqtgraph
pkgname=python-taurus-pyqtgraph
pkgver=0.9.9
pkgrel=1
pkgdesc="Taurus extension providing pyqtgraph-based widgets"
arch=("any")
url="https://gitlab.com/taurus-org/${_name}"
license=("CC-BY-3.0")
depends=(python python-pyqtgraph python-taurus python-click python-numpy python-lxml python-ply)
optdepends=("python-pyhdbpp: Plotting data from the HDB++ archiver")
makedepends=(python-build python-installer)
source=("${_name}-${pkgver}.tar.gz::https://gitlab.com/taurus-org/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('2fd48787e80e11f725ef9a2f8669445741b2a6f4a6c8da68ca7dcb8b730749bd')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
