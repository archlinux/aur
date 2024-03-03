# Maintainer: Alex Hirzel <alex at hirzel period us>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=python-torchmetrics
_pkgname=torchmetrics
pkgver=1.3.1
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
sha512sums=('9ff9852d7a42458b6e3fd23bc7033d3206b35311cbb497d06e00d189955813495862751995f0d71ffe234af5de6608ca3d90d3ef878903cafc6d3a601e1ddb0f')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
