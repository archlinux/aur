# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-es_core_news_md
pkgver=3.2.0
pkgrel=1
pkgdesc='Spanish pretrained model for spaCy (medium)'
arch=(any)
url='https://spacy.io/models/es#section-es_core_news_md'
license=(GPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/es_core_news_md-${pkgver}/es_core_news_md-${pkgver}.tar.gz")
b2sums=('bb7be5cc43c079ca37f7942a7d2b61cb7cd0a4d3692808b82e96df1983ba810b653e26df22c9a949d11c2cf6465dbacecdffc2651b77eaf46754eaf53ffc75b7')

build() {
	cd es_core_news_md-${pkgver}
	python setup.py build
}

package() {
	cd es_core_news_md-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
