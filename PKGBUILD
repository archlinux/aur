# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_md
pkgver=3.6.0
pkgrel=1
pkgdesc="English pipeline optimized for CPU. Components: tok2vec, tagger, parser, senter, ner, attribute_ruler, lemmatizer."
arch=(any)
url="https://spacy.io/models/en#en_core_web_md"
license=(MIT)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/en_core_web_md-${pkgver}/en_core_web_md-${pkgver}.tar.gz")
sha256sums=("b79ce388adb3c5fbcd37577254769ba851950392ab9667a789550b5a6931c8a6")

build() {
	cd en_core_web_md-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
	cd en_core_web_md-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
