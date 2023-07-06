# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_trf
pkgver=3.6.1
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
sha256sums=("1e79622f0d3df5606d874e38062358dfb777eb21c6c589131c7bc7ed10459e40")

build() {
    cd en_core_web_trf-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd en_core_web_trf-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
