# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-open-clip-torch'
_name=open_clip_torch
pkgver='2.19.0'
pkgrel=1
pkgdesc="Open source implementation of OpenAI's CLIP (Contrastive Language-Image Pre-training)."
url="https://github.com/mlfoundations/open_clip"
depends=(
#'python-torchvision'
	'python-fsspec'
	'python-ftfy'
	'python-huggingface-hub'
	'python-pandas'
	'python-regex'
	'python-timm'
	'python-transformers'
	'python-torchvision'
	'python-tqdm'
	'python-webdataset'
)
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://github.com/mlfoundations/open_clip/archive/refs/tags/v${pkgver}.zip")
sha256sums=('314aef839252155f00feba3f16ece6bef85d797bacdd269a862eded82aba21fc')

build() {
	cd "${srcdir}/open_clip-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/open_clip-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
