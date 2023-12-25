# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=python-torchmetrics
_pkgname=torchmetrics
pkgver=1.2.1
pkgrel=2
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
  python-build
  python-installer
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/PyTorchLightning/metrics/releases/download/v${pkgver}/torchmetrics-${pkgver}.tar.gz"
)
sha512sums=('017d2262d3018687efdb72578bd01ec79c1133867927e70e058ebdf5a0a34748b952ea6742f0b4762f1ddf7a5edbc9988dc4b56d92e516acdac1c74225ebeca1')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
