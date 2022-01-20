# Maintainer: Yohann D'Anello <ynerant@crans.org>

pkgname=python-spacy-fr_core_news_md
pkgver=3.2.0
pkgrel=1
pkgdesc='French pretrained model for spaCy (medium)'
url='https://spacy.io/models/fr#section-en_core_news_md'
depends=(python-spacy)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/fr_core_news_md-${pkgver}/fr_core_news_md-${pkgver}.tar.gz")
sha256sums=('3b09738b9060e4f857dacd93538921b5b54f0c0c514e43a06fbcd51933993fd8')

build() {
	cd fr_core_news_md-${pkgver}
	python setup.py build
}

package() {
	cd fr_core_news_md-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
