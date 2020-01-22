# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-nl_core_news_sm
pkgver=2.2.5
pkgrel=2
pkgdesc="Dutch multi-task CNN trained on the Universal Dependencies and WikiNER corpus for spaCy"
url="https://spacy.io/models/nl#section-nl_core_news_sm"
depends=('python-spacy')
makedepends=('python-setuptools')
license=('CCPL')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/nl_core_news_sm-${pkgver}/nl_core_news_sm-${pkgver}.tar.gz")
sha256sums=('2d4a0bbe199b46e7349b58d48cc436f6fcfd0c77984e2fe07add09695c6c6298')

build(){
    cd nl_core_news_sm-${pkgver}
    python setup.py build
}

package(){
    cd nl_core_news_sm-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
