# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_md
pkgver=3.2.0
pkgrel=1
pkgdesc='English pretrained model for spaCy (medium)'
arch=(any)
url='https://spacy.io/models/en#section-en_core_web_md'
license=(MIT)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/en_core_web_md-${pkgver}/en_core_web_md-${pkgver}.tar.gz")
b2sums=('9180c9963de4412e56aacfd04e89cb8029d185a053402163203b95ce90ca456fc6d3e62f99d898f5e7631bdcde20dd58ed7745cf28ea89fe7dcc9da1e8a7366f')

build() {
	cd en_core_web_md-${pkgver}
	python setup.py build
}

package() {
	cd en_core_web_md-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
