# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-spacy-de_core_news_sm
pkgver=3.6.0
pkgrel=2
pkgdesc="German pipeline optimized for CPU. Components: tok2vec, tagger, morphologizer, parser, lemmatizer (trainable_lemmatizer), senter, ner."
url="https://spacy.io/models/de#de_core_news_sm"
depends=('python-spacy')
makedepends=('python-setuptools')
license=('MIT')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/de_core_news_sm-${pkgver}/de_core_news_sm-${pkgver}.tar.gz")
sha256sums=("f5fe20190cd09712eb2a9e6e010080bcdd8ee8a6183ab4d1baa90f44a9369581")

build() {
    cd de_core_news_sm-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd de_core_news_sm-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
