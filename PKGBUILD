# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_md
pkgver=3.0.0
pkgrel=1
pkgdesc="English pretrained model for spaCy (medium)"
url="https://spacy.io/models/en#section-en_core_web_md"
depends=('python-spacy')
makedepends=('python-setuptools')
license=('MIT')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/en_core_web_md-${pkgver}/en_core_web_md-${pkgver}.tar.gz")
sha256sums=('45757583a3c9d15c6895cf4bf9512e86243bab8cda51512c127f5cbdc34ac630')

build() {
	cd en_core_web_md-${pkgver}
	python setup.py build
}

package() {
	cd en_core_web_md-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
