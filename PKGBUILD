# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-es_core_news_sm
pkgver=3.2.0
pkgrel=1
pkgdesc='Spanish pretrained model for spaCy (small)'
arch=(any)
url='https://spacy.io/models/es#section-es_core_news_sm'
license=(GPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/es_core_news_sm-${pkgver}/es_core_news_sm-${pkgver}.tar.gz")
b2sums=('867d9f19285cbc0aba74db3414089ac3587997722b673185b35c0bbaa8ec9188d3051b6cb789a822ca1b1c098ebb0342601b10d98785f48039922e0dc624d733')

build() {
	cd es_core_news_sm-${pkgver}
	python setup.py build
}

package() {
	cd es_core_news_sm-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
