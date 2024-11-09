# Maintainer: Emmy D'Anello <emmy@luemy.eu>

pkgname=python-spacy-fr_core_news_md
pkgver=3.8.0
pkgrel=1
pkgdesc='French pretrained model for spaCy (medium)'
url='https://spacy.io/models/fr#section-en_core_news_md'
depends=(python-spacy)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/fr_core_news_md-${pkgver}/fr_core_news_md-${pkgver}.tar.gz")
sha256sums=('0353cfe24a3d0ef8b2ac1b493a5955708e92fe9647b7ddcaee9da09cee8ad6a9')

build() {
	cd fr_core_news_md-${pkgver}
	python setup.py build
}

package() {
	cd fr_core_news_md-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
