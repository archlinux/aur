# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-nl_core_news_sm
pkgver=2.3.0
pkgrel=1
pkgdesc="Dutch multi-task CNN trained on the Universal Dependencies and WikiNER corpus for spaCy"
url="https://spacy.io/models/nl#section-nl_core_news_sm"
depends=('python-spacy')
makedepends=('python-setuptools')
license=('CCPL')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/nl_core_news_sm-${pkgver}/nl_core_news_sm-${pkgver}.tar.gz")
sha256sums=('d2765b86cf8434dd5a7c1ffaaa591d90ae967738f71588baf240b263eff99b2a')

build(){
    cd nl_core_news_sm-${pkgver}
    python setup.py build
}

package(){
    cd nl_core_news_sm-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
