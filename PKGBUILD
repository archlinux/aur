# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-es_core_news_sm
pkgver=2.1.0
pkgrel=2
pkgdesc="Spanish multi-task CNN trained on the AnCora and WikiNER corpus for spaCy"
url="https://spacy.io/models/es#section-es_core_news_sm"
makedepends=('python-setuptools')
license=('GPL')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/es_core_news_sm-${pkgver}/es_core_news_sm-${pkgver}.tar.gz")
sha256sums=('b021b1f5e3c1c296534b8dc1a1527293705e76b9b8611a9506095cfcc2f2beea')

build() {
    cd es_core_news_sm-${pkgver}
    python setup.py build
}

package() {
    cd es_core_news_sm-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
