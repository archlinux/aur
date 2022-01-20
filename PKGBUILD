# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_sm
pkgver=3.2.0
pkgrel=1
pkgdesc='English pretrained model for spaCy (small)'
arch=(any)
url='https://spacy.io/models/en#section-en_core_web_sm'
license=(MIT)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/en_core_web_sm-${pkgver}/en_core_web_sm-${pkgver}.tar.gz")
b2sums=('291b74cc33488594d5e969af82f191029c5db72780a6e3c4435d1890749dcdf3ac4f08b513878b507c211daeb0f0ed86cfc874e23bcc07035f97e0843ed423fc')

build() {
	cd en_core_web_sm-${pkgver}
	python setup.py build
}

package() {
	cd en_core_web_sm-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
