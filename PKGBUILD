# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-nl_core_news_sm
pkgver=2.1.0
pkgrel=2
pkgdesc="Dutch multi-task CNN trained on the Universal Dependencies and WikiNER corpus for spaCy"
url="https://spacy.io/models/nl#section-nl_core_news_sm"
makedepends=('python-setuptools')
license=('CCPL')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/nl_core_news_sm-${pkgver}/nl_core_news_sm-${pkgver}.tar.gz")
sha256sums=('7e0cb3d41940b17359b8feef9c74aa5d6570c4c4a35abe1708d9e97ce5b19e7b')

build(){
    cd nl_core_news_sm-${pkgver}
    python setup.py build
}

package(){
    cd nl_core_news_sm-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
