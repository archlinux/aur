# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-spacy-de_core_news_md
pkgver=3.3.0
pkgrel=1
pkgdesc="German pipeline optimized for CPU. Components: tok2vec, tagger, morphologizer, parser, lemmatizer (trainable_lemmatizer), senter, ner."
url="https://spacy.io/models/de#de_core_news_md"
depends=('python-spacy')
makedepends=('python-setuptools')
license=('MIT')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/de_core_news_md-${pkgver}/de_core_news_md-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/explosion/spaCy/master/LICENSE")
sha256sums=("360a238b2925146babca815566f5cd5dbd213150160f8eaab8df1ee826c72378"
            "c07800e058b1b544eb9d47dd81687582fe6830c1ddc47f57521fc93628685915")

build() {
    cd de_core_news_md-${pkgver}
    python setup.py build
}

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd de_core_news_md-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
