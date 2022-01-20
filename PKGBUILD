# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_trf
pkgver=3.2.0
pkgrel=1
pkgdesc='English pretrained model for spaCy (transformers)'
arch=(any)
url='https://spacy.io/models/en#section-en_core_web_trf'
license=(MIT)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/en_core_web_trf-${pkgver}/en_core_web_trf-${pkgver}.tar.gz")
b2sums=('85a93216b0e58b2327a2fef232f90480ba3f9dcd818bd095f6e9bcd82ff7efe50d575bfd9abaeb83f3b6bec3d4837ecadef5e81c4efd64d2cc5a8587fd3b9aac')

build() {
	cd en_core_web_trf-${pkgver}
	python setup.py build
}

package() {
	cd en_core_web_trf-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
