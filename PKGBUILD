# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-spacy-de_core_news_md
pkgver=2.3.0
pkgrel=1
pkgdesc="German multi-task CNN trained on the TIGER and WikiNER corpora. Assigns word vectors, POS tags, dependency parses and named entities. Word vectors trained using FastText CBOW on Wikipedia and OSCAR (Common Crawl)."
url="https://spacy.io/models/de#de_core_news_md"
depends=('python-spacy')
makedepends=('python-setuptools')
license=('MIT')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/de_core_news_md-${pkgver}/de_core_news_md-${pkgver}.tar.gz")
sha256sums=('2636294e1e9351cca312a88659859d367684cca968a83b837525030078c8b14f')

build() {
    cd de_core_news_md-${pkgver}
    python setup.py build
}

package() {
    cd de_core_news_md-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
