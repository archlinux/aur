# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_trf
pkgver=3.7.1
pkgrel=1
pkgdesc="English transformer pipeline (roberta-base). Components: transformer, tagger, parser, ner, attribute_ruler, lemmatizer."
arch=(any)
url="https://spacy.io/models/en#en_core_web_trf"
license=(MIT)
depends=(
    python-spacy
    python-spacy-transformers
)
makedepends=(
    python-pip
    python-wheel
    python-setuptools
)
source=("https://github.com/explosion/spacy-models/releases/download/en_core_web_trf-${pkgver}/en_core_web_trf-${pkgver}.tar.gz")
sha256sums=("99b2fb0f49f8d8edf6353b8e953d47d5498e0b39014245d8fe4d2910e77bdaee")

build() {
    cd en_core_web_trf-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd en_core_web_trf-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
