# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_lg
pkgver=3.2.0
pkgrel=1
pkgdesc='English pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/en#section-en_core_web_lg'
license=(MIT)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/en_core_web_lg-${pkgver}/en_core_web_lg-${pkgver}.tar.gz")
b2sums=('fd346ba82a4b372dd53bd4d394e78ff16162dfb1c76a80af939610ab99c6dd654d0888b8ae9970b7a5497d7e0d38a391ae53d255e2d3de954b9241cf3e211edc')

build() {
	cd en_core_web_lg-${pkgver}
	python setup.py build
}

package() {
	cd en_core_web_lg-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
