# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-nl_core_news_lg
pkgver=3.2.0
pkgrel=1
pkgdesc='Dutch pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/nl#section-nl_core_news_lg'
license=(CCPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/nl_core_news_lg-${pkgver}/nl_core_news_lg-${pkgver}.tar.gz")
b2sums=('f6ecfd8b0d24b308501438766af4dc614436aa613d98b29f938d229a60cf6027eda273ed22cbae4c1a9dd5cabbd0ba76c444bfc6f8df48db2db11292ae90031d')

build() {
	cd nl_core_news_lg-${pkgver}
	python setup.py build
}

package() {
	cd nl_core_news_lg-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
