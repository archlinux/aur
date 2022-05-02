# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-spacy-de_core_news_lg
pkgver=3.3.0
pkgrel=1
pkgdesc="German pipeline optimized for CPU. Components: tok2vec, tagger, morphologizer, parser, lemmatizer (trainable_lemmatizer), senter, ner."
url="https://spacy.io/models/de#de_core_news_lg"
depends=('python-spacy')
makedepends=('python-setuptools')
license=('MIT')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/de_core_news_lg-${pkgver}/de_core_news_lg-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/explosion/spaCy/master/LICENSE")
sha256sums=("0e2cac97bde15485412ee5c1f4d3e25fc32f74c4c12f60fea98747f70aae00cd"
            "c07800e058b1b544eb9d47dd81687582fe6830c1ddc47f57521fc93628685915")

build() {
    cd de_core_news_lg-${pkgver}
    python setup.py build
}

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd de_core_news_lg-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
