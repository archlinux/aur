# Maintainer: redponike <proton (dot) me>
# Maintainer: Alex Hirzel <alex at hirzel period us>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=python-torchmetrics
_pkgname=${pkgname#python-}
pkgver=1.7.1
pkgrel=1
pkgdesc='Machine learning metrics for distributed, scalable PyTorch applications'
arch=('any')
url='https://github.com/PyTorchLightning/metrics'
license=('Apache-2.0')
depends=(
  'python-lightning-utilities'
  'python-numpy'
  'python-packaging'
  'python-pytorch'
)
optdepends=(
  'python-einops: Multimodal subdomain dependency'
  'python-timm: Multimodal subdomain dependency'
  'python-nltk: Text subdomain dependency'
  'python-regex: Text subdomain dependency'
  'python-sentencepiece: Text subdomain dependency'
  'python-transformers: Text and multimodel subdomains dependency'
  'python-tqdm: Text subdomain dependency'
  'python-onnxruntime: Audio subdomain dependency'
  'python-requests: Audio subdomain dependency'
  'python-torchaudio: Audio subdomain dependency'
  'python-scipy: Image subdomain dependency'
  'python-torch-fidelity: Image subdomain dependency'
  'python-torchvision: Image and detection subdomains dependency'
  'python-pycocotools: Detection subdomain dependency'
  'python-matplotlib: Visual subdomain dependency'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('8c0d475f7bee8fc66ef169fdbb180f5f7f09822d8c629ae2a2ad5fd631e5fc0c6ca34307bbbb0f0d2b337a68af68be3388695fcf2b6df9f5f47206baa6b92579')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --no-isolation --wheel
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
# vim:set ts=2 sw=2 et:
