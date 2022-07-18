# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-spacy-de_core_news_sm
pkgver=3.4.0
pkgrel=1
pkgdesc="German pipeline optimized for CPU. Components: tok2vec, tagger, morphologizer, parser, lemmatizer (trainable_lemmatizer), senter, ner."
url="https://spacy.io/models/de#de_core_news_sm"
depends=('python-spacy')
makedepends=('python-setuptools')
license=('MIT')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/de_core_news_sm-${pkgver}/de_core_news_sm-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/explosion/spaCy/master/LICENSE")
sha256sums=("33b8c16beaa2e6045bb6d91611dcb693cffec548f570755d7334d3a148def5a2"
            "c07800e058b1b544eb9d47dd81687582fe6830c1ddc47f57521fc93628685915")

build() {
    cd de_core_news_sm-${pkgver}
    python setup.py build
}

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd de_core_news_sm-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
