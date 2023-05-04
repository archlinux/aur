# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=python-torchmetrics
_pkgname=torchmetrics
pkgver=0.11.4
pkgrel=1
pkgdesc='Machine learning metrics for distributed, scalable PyTorch applications'
arch=('any')
url='https://github.com/PyTorchLightning/metrics'
license=('Apache')
depends=(
  python-regex
  python-setuptools
  python-torchvision
  python-tqdm
)
optdepends=(
  python-fidelity
  python-lpips
)
makedepends=(
  python-setuptools
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/PyTorchLightning/metrics/releases/download/v${pkgver}/torchmetrics-${pkgver}.tar.gz"
)
sha512sums=('c5d9a6ec9ccac99ef79a11ec76d3d8b58a370d09e90d7927dbc2455f83c99ed4d233e5bfd3d0b94c420566400e4d46affe6990721a69c33f2c5e1608b09d407c')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
