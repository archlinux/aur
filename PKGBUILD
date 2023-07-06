# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-spacy-de_dep_news_trf
pkgver=3.6.1
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
sha256sums=("9331c30ef0358712d3c6dbb57359cf2cfa0c9d81b070a779259df81af0b9ca0b")

build() {
    cd de_dep_news_trf-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd de_dep_news_trf-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
