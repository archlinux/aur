# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-es_core_news_lg
pkgver=3.2.0
pkgrel=1
pkgdesc='Spanish pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/es#section-es_core_news_lg'
license=(GPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/es_core_news_lg-${pkgver}/es_core_news_lg-${pkgver}.tar.gz")
b2sums=('cfc2da69dafad0d107e390ca39b201cc2be63d40e1ca7b4f5cb13fc829078362133ac65d7a7cb5ae60a9616780b8650962d541bd5c9138425409bd41a787c0b9')

build() {
	cd es_core_news_lg-${pkgver}
	python setup.py build
}

package() {
	cd es_core_news_lg-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
