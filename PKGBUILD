# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-spacy-de_core_news_sm
pkgver=2.3.0
pkgrel=2
pkgdesc="German multi-task CNN trained on the TIGER and WikiNER corpora. Assigns context-specific token vectors, POS tags, dependency parses and named entities."
url="https://spacy.io/models/de#de_core_news_sm"
depends=('python-spacy')
makedepends=('python-setuptools')
license=('MIT')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/de_core_news_sm-${pkgver}/de_core_news_sm-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/explosion/spaCy/master/LICENSE")
sha256sums=("87fe081677c54615b8f5b3e701b8279c929dc9b5ed2aed1545e2494b5cae8b01"
            "2946c76df2417fe4e29c693e4d877f8516630740f0ede219edf1b0d06c61d536")

build() {
    cd de_core_news_sm-${pkgver}
    python setup.py build
}

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd de_core_news_sm-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
