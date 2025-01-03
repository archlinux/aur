# Maintainer: Alex Hirzel <alex at hirzel period us>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=python-torchmetrics
_pkgname=torchmetrics
pkgver=1.6.1
pkgrel=1
pkgdesc='Machine learning metrics for distributed, scalable PyTorch applications'
arch=('any')
url='https://github.com/PyTorchLightning/metrics'
license=('Apache-2.0')
depends=(
  python-lightning-utilities
  python-nltk
  python-numpy
  python-regex
  python-sentencepiece
  python-torchaudio
  python-torchvision
  python-tqdm
  python-typing_extensions
)
optdepends=(
  python-fidelity
  python-lpips
  python-transformers
)
makedepends=(
  python-build
  python-installer
  python-packaging
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/PyTorchLightning/metrics/releases/download/v${pkgver}/torchmetrics-${pkgver}.tar.gz"
)
sha512sums=('d3c456e7d8daec2e8e092b757309bd8f51bd365298630a33d428df1c6cc865fb6c6aaa30b05188a452f1f1cb9a6d1be448196f06525f687b568d0d34e3418bf3')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
