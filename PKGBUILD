# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-open-clip-torch'
_name=open_clip_torch
pkgver='2.24.0'
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
license=('MIT')
arch=('any')
source=("https://github.com/mlfoundations/open_clip/archive/refs/tags/v${pkgver}.zip")
sha256sums=('0c49789a0e1f8f75b4ab8804a6c9c1b01b244da23c248e2a5d5590d1fec1633f')

build() {
	cd "${srcdir}/open_clip-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/open_clip-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
