# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_lg
pkgver=3.6.0
pkgrel=1
pkgdesc="English pipeline optimized for CPU. Components: tok2vec, tagger, parser, senter, ner, attribute_ruler, lemmatizer."
url="https://spacy.io/models/en#en_core_web_lg"
depends=(python-spacy)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/en_core_web_lg-${pkgver}/en_core_web_lg-${pkgver}.tar.gz")
sha256sums=("21dbeb056c4e281d717fa1bfd3711fa1255cb8766d22463c158bbaa2d4e1fc39")

build() {
    cd en_core_web_lg-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd en_core_web_lg-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
