# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-es_core_news_sm
pkgver=2.1.0a7
pkgrel=1
pkgdesc="Spanish multi-task CNN trained on the AnCora and WikiNER corpus for spaCy"
url="https://spacy.io/models/en#section-en_core_web_sm"
makedepends=('python-setuptools')
license=('GPL')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/es_core_news_sm-${pkgver}/es_core_news_sm-${pkgver}.tar.gz")
sha256sums=('635634edbb74e07e41be0c7308e7cc3735aa3c11d4796dd3a2573b74d98116cd')

build() {
    cd es_core_news_sm-${pkgver}
    python setup.py build
}

package() {
    cd es_core_news_sm-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
