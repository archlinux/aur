# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_md
pkgver=3.1.0
pkgrel=1
pkgdesc='English pretrained model for spaCy (medium)'
url='https://spacy.io/models/en#section-en_core_web_md'
depends=(python-spacy)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/en_core_web_md-${pkgver}/en_core_web_md-${pkgver}.tar.gz")
sha256sums=('7f0de3a2a7b6d6e17ce75188a7ec227c2283dc2df010ee5e0905096335d7c594')

build() {
	cd en_core_web_md-${pkgver}
	python setup.py build
}

package() {
	cd en_core_web_md-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
