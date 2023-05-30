# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-open-clip-torch'
_name=open_clip_torch
pkgver='2.20.0'
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
sha256sums=('c2c565cc0e3697699f8d45ee388d55d6f0b9e28f7b3bbca3cd6749447b928ad5')

build() {
	cd "${srcdir}/open_clip-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/open_clip-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
