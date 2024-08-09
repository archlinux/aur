# Maintainer: Alex Hirzel <alex at hirzel period us>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=python-torchmetrics
_pkgname=torchmetrics
pkgver=1.4.1
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
)
optdepends=(
  python-fidelity
  python-lpips
  python-transformers
)
makedepends=(
  python-build
  python-installer
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/PyTorchLightning/metrics/releases/download/v${pkgver}/torchmetrics-${pkgver}.tar.gz"
)
sha512sums=('51799f07c86f09bec8498dc51965e519805d89ab34b1076c23532263da7df9c5ac88b7227319c5e1cfea76841ffd7eddaf932cce4622cc1256a20f54e945b528')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
