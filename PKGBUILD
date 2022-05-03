# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-spacy-de_dep_news_trf
pkgver=3.3.0
pkgrel=1
pkgdesc="German transformer pipeline (bert-base-german-cased). Components: transformer, tagger, morphologizer, parser, lemmatizer (trainable_lemmatizer)."
url="https://spacy.io/models/de#de_dep_news_trf"
depends=(
    python-spacy
    python-spacy-transformers
)
makedepends=(
    python-pip
    python-wheel
    python-setuptools
)
license=(MIT)
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/de_dep_news_trf-${pkgver}/de_dep_news_trf-${pkgver}.tar.gz")
sha256sums=("074ae711e98f5b796934b16e04fb6918c2bff9c39ae258d3989587c95ae994a1")

build() {
    cd de_dep_news_trf-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd de_dep_news_trf-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
