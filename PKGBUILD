# Maintainer: Alex Hirzel <alex at hirzel period us>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=python-torchmetrics
_pkgname=torchmetrics
pkgver=1.3.0
pkgrel=1
pkgdesc='Machine learning metrics for distributed, scalable PyTorch applications'
arch=('any')
url='https://github.com/PyTorchLightning/metrics'
license=('Apache-2.0')
depends=(
  python-lightning-utilities
  python-nltk
  python-regex
  python-sentencepiece
  python-torchvision
  python-tqdm
  python-transformers
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
sha512sums=('3bd59adc13f7aa2e7c0d1b8367119d18477e44112195fd621afa3e3fe7e64f9a8d9037cd4417c8454a2cb814a956765e4f91b62add5ba30bcb001676e5017c3a')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
