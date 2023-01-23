# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_lg
pkgver=3.5.0
pkgrel=1
pkgdesc="English transformer pipeline (roberta-base). Components: transformer, tagger, parser, ner, attribute_ruler, lemmatizer."
url="https://spacy.io/models/en#en_core_web_lg"
depends=(python-spacy)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/en_core_web_lg-${pkgver}/en_core_web_lg-${pkgver}.tar.gz")
sha256sums=("29732c8167e444686e0d8716d6b09123f3fa2d32baf7dbd2d8bc6c1b2c1b6945")

build() {
    cd en_core_web_lg-${pkgver}
    python setup.py build
}

package() {
    cd en_core_web_lg-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
