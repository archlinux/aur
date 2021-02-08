# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_sm
pkgver=3.0.0
pkgrel=1
pkgdesc="English pretrained model for spaCy (small)"
url="https://spacy.io/models/en#section-en_core_web_sm"
depends=('python-spacy')
makedepends=('python-setuptools')
license=('MIT')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/en_core_web_sm-${pkgver}/en_core_web_sm-${pkgver}.tar.gz")
sha256sums=('0673b3ce4a28a19e99dc0fc3f8f7fe67b936c41749e6b70f778ec5f9f78f3a66')

build() {
	cd en_core_web_sm-${pkgver}
	python setup.py build
}

package() {
	cd en_core_web_sm-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
