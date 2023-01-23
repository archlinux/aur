# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_trf
pkgver=3.5.0
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
sha256sums=("ecb0526630a1a05b2a2df6636bd8059bd0b4cb2280e91708f03f7838d14d0be7")

build() {
    cd en_core_web_trf-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd en_core_web_trf-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
