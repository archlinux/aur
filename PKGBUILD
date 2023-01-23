# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_md
pkgver=3.5.0
pkgrel=1
pkgdesc="English pipeline optimized for CPU. Components: tok2vec, tagger, parser, senter, ner, attribute_ruler, lemmatizer."
arch=(any)
url="https://spacy.io/models/en#en_core_web_md"
license=(MIT)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/en_core_web_md-${pkgver}/en_core_web_md-${pkgver}.tar.gz")
sha256sums=("6fa7ec39e9228ce5306147ede7c15cf58cf731259a9d75ee09d7d6bfb49c800b")

build() {
	cd en_core_web_md-${pkgver}
	python setup.py build
}

package() {
	cd en_core_web_md-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
