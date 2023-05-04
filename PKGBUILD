# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-open-clip-torch'
_name=open_clip_torch
pkgver='2.18.0'
pkgrel=1
pkgdesc="Open source implementation of OpenAI's CLIP (Contrastive Language-Image Pre-training)."
url="https://github.com/mlfoundations/open_clip"
depends=('python-protobuf' 'python-huggingface-hub' 'python-sentencepiece' 'python-pandas' 'python-regex' 'python-torchvision' 'python-tqdm' 'python-fsspec' 'python-ftfy' 'python-timm')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://github.com/mlfoundations/open_clip/archive/refs/tags/v${pkgver}.zip")
sha256sums=('13a2016db05492a4aa63213e1811615445293865d9e39511892774aedbb6368c')

build() {
	cd "${srcdir}/open_clip-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/open_clip-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

