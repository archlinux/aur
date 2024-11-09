# Maintainer: Emmy D'Anello <emmy@luemy.eu>

pkgname=python-spacy-fr_core_news_sm
pkgver=3.8.0
pkgrel=1
pkgdesc='French pretrained model for spaCy (small)'
url='https://spacy.io/models/fr#section-en_core_news_sm'
depends=(python-spacy)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/fr_core_news_sm-${pkgver}/fr_core_news_sm-${pkgver}.tar.gz")
sha256sums=('517505e9cd18234405bb6fb481a476462dfb1a8e0f7bbc2d7760831e94cce78c')

build() {
	cd fr_core_news_sm-${pkgver}
	python setup.py build
}

package() {
	cd fr_core_news_sm-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
