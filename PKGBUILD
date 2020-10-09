# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-es_core_news_sm
pkgver=2.3.1
pkgrel=1
pkgdesc="Spanish multi-task CNN trained on the AnCora and WikiNER corpus for spaCy"
url="https://spacy.io/models/es#section-es_core_news_sm"
depends=('python-spacy')
makedepends=('python-setuptools')
license=('GPL')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/es_core_news_sm-${pkgver}/es_core_news_sm-${pkgver}.tar.gz")
sha256sums=('793275be8143592e54abe6e08c4099437bf137e6c158694698ca8468e393737d')

build() {
    cd es_core_news_sm-${pkgver}
    python setup.py build
}

package() {
    cd es_core_news_sm-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
