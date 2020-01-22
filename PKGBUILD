# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-es_core_news_sm
pkgver=2.2.5
pkgrel=2
pkgdesc="Spanish multi-task CNN trained on the AnCora and WikiNER corpus for spaCy"
url="https://spacy.io/models/es#section-es_core_news_sm"
depends=('python-spacy')
makedepends=('python-setuptools')
license=('GPL')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/es_core_news_sm-${pkgver}/es_core_news_sm-${pkgver}.tar.gz")
sha256sums=('d1bd75f7c0dcf2b6107d9aaae367a3f94dd7671ea0529e64727b15155ebf19a6')

build() {
    cd es_core_news_sm-${pkgver}
    python setup.py build
}

package() {
    cd es_core_news_sm-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
