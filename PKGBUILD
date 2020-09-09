# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-spacy-de_core_news_lg
pkgver=2.3.0
pkgrel=1
pkgdesc="German multi-task CNN trained on the TIGER and WikiNER corpora. Assigns word vectors, POS tags, dependency parses and named entities. Word vectors trained using FastText CBOW on Wikipedia and OSCAR (Common Crawl)."
url="https://spacy.io/models/de#de_core_news_lg"
depends=('python-spacy')
makedepends=('python-setuptools')
license=('MIT')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/de_core_news_lg-${pkgver}/de_core_news_lg-${pkgver}.tar.gz")
sha256sums=('cd3c565cfb6dd3df535b109077466685986059b18387259cc1fa7cf2db833d66')

build() {
    cd de_core_news_lg-${pkgver}
    python setup.py build
}

package() {
    cd de_core_news_lg-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
