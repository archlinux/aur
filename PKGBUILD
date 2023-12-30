# Maintainer: Ash Price <eisleggje@gmail.com>
#
pkgname=python-spacy-es_core_news_lg
pkgver=3.7.0
pkgrel=1
pkgdesc='Spanish pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/es#section-es_core_news_lg'
license=(GPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/es_core_news_lg-${pkgver}/es_core_news_lg-${pkgver}.tar.gz")
b2sums=('526a753a5cdc5dae138a18545948a2940cd974a3ddffff91c6dc64d716753ef809659bae97e92f1a47fd72bf1a3c4edd09e32bb30b7b68a44c7591b12524dac1')

build() {
	cd es_core_news_lg-${pkgver}
	python setup.py build
}

package() {
	cd es_core_news_lg-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
