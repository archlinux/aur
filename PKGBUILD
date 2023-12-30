# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-nl_core_news_lg
pkgver=3.7.0
pkgrel=1
pkgdesc='Dutch pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/nl#section-nl_core_news_lg'
license=(CCPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/nl_core_news_lg-${pkgver}/nl_core_news_lg-${pkgver}.tar.gz")
b2sums=('f2299d5b8688ea357252a2c30a97774dbbfec1d2aa80404d7c5537ed1312d4e4909daec509c99aed1419202da67dad1a90732f98700715070262287c57d26333')

build() {
	cd nl_core_news_lg-${pkgver}
	python setup.py build
}

package() {
	cd nl_core_news_lg-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
