# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-open-clip-torch'
_name=open_clip_torch
pkgver='2.23.0'
pkgrel=1
pkgdesc="Open source implementation of OpenAI's CLIP (Contrastive Language-Image Pre-training)."
url="https://github.com/mlfoundations/open_clip"
depends=(
#'python-torchvision'
	'python-braceexpand'
	'python-fsspec'
	'python-ftfy'
	'python-fvcore'
	'python-horovod'
	'python-huggingface-hub'
	'python-nltk'
	'python-pandas'
	'python-regex'
	'python-timm'
	'python-torchvision'
	'python-tqdm'
	'python-transformers'
	'python-wandb'
	'python-webdataset'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('Apache')
arch=('any')
source=("https://github.com/mlfoundations/open_clip/archive/refs/tags/v${pkgver}.zip")
sha256sums=('5878012873e6f887e86b73dacc7ce197718d0695f58321e02a22408d197dce0b')

build() {
	cd "${srcdir}/open_clip-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/open_clip-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
