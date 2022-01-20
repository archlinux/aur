# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-nl_core_news_sm
pkgver=3.2.0
pkgrel=1
pkgdesc='Dutch pretrained model for spaCy (small)'
arch=(any)
url='https://spacy.io/models/nl#section-nl_core_news_sm'
license=(CCPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/nl_core_news_sm-${pkgver}/nl_core_news_sm-${pkgver}.tar.gz")
b2sums=('5498c40692cd96264a4691e3938914934c759b2a7a430e97ad98b0f1727c7d86a96fc80241850f238b3c2cb24d4ddf518fcd330c7604d4e511ad97f926831745')

build() {
	cd nl_core_news_sm-${pkgver}
	python setup.py build
}

package() {
	cd nl_core_news_sm-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
