# Maintainer: Yohann D'Anello <ynerant@crans.org>

pkgname=python-spacy-fr_core_news_sm
pkgver=3.2.0
pkgrel=1
pkgdesc='French pretrained model for spaCy (small)'
url='https://spacy.io/models/fr#section-en_core_news_sm'
depends=(python-spacy)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/fr_core_news_sm-${pkgver}/fr_core_news_sm-${pkgver}.tar.gz")
sha256sums=('bcdd2c8c9ccef064f549298d2c5a4f1d22d96ba85011a989125ea4477fad9334')

build() {
	cd fr_core_news_sm-${pkgver}
	python setup.py build
}

package() {
	cd fr_core_news_sm-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
