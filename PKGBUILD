# Maintainer: Ash Price <eisleggje@gmail.com>
#
pkgname=python-spacy-es_core_news_lg
pkgver=3.8.0
pkgrel=1
pkgdesc='Spanish pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/es#section-es_core_news_lg'
license=(GPL)
depends=()
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/es_core_news_lg-${pkgver}/es_core_news_lg-${pkgver}.tar.gz")
b2sums=('d97b175c848016a21335d79bab411ad8883babf38a9289e87e8874c04653803033f8368f93c9bdec697d723a7d5d2f20e8b5d324c5edd3b17152d0065f079964')

build() {
	cd es_core_news_lg-${pkgver}
	python setup.py build
}

package() {
	cd es_core_news_lg-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
