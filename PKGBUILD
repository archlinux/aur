# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_sm
pkgver=3.1.0
pkgrel=1
pkgdesc='English pretrained model for spaCy (small)'
url='https://spacy.io/models/en#section-en_core_web_sm'
depends=(python-spacy)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/en_core_web_sm-${pkgver}/en_core_web_sm-${pkgver}.tar.gz")
sha256sums=('f624cbee5511e6c90e4ff9ed502c8acab14bf82096c0e28a4645564b70f87660')

build() {
	cd en_core_web_sm-${pkgver}
	python setup.py build
}

package() {
	cd en_core_web_sm-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
