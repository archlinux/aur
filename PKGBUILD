# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=python-torchmetrics
_pkgname=torchmetrics
pkgver=1.2.0
pkgrel=1
pkgdesc='Machine learning metrics for distributed, scalable PyTorch applications'
arch=('any')
url='https://github.com/PyTorchLightning/metrics'
license=('Apache')
depends=(
  python-lightning-utilities
  python-regex
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
sha512sums=('6ce642bf67d8455203c39154c75e6fc16fb4c26654fef54007f64fea16bba3dbb13df1690f2c6eb234076002cc96b980b633d31df89a67a728bc10ab88c3bf03')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
