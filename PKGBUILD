# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-open-clip-torch'
_name=open_clip_torch
pkgver='2.17.1'
pkgrel=1
pkgdesc="Open source implementation of OpenAI's CLIP (Contrastive Language-Image Pre-training)."
url="https://github.com/mlfoundations/open_clip"
depends=('python-protobuf' 'python-huggingface-hub' 'python-sentencepiece' 'python-pandas' 'python-regex' 'python-torchvision' 'python-tqdm' 'python-ftfy' 'python-timm')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://github.com/mlfoundations/open_clip/archive/refs/tags/v${pkgver}.zip")
sha256sums=('a47fa12a84384e0e99d810a27d6675989712b1468dd3c665dd6e0d9910b85d9e')

build() {
	cd "${srcdir}/open_clip-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/open_clip-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

