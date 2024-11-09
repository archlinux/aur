# Maintainer: Emmy D'Anello <emmy@luemy.eu>

pkgname=python-spacy-entity-linker
pkgver=1.0.3
pkgrel=1
pkgdesc='Linked Entity Pipeline for spaCy'
url='https://github.com/egerber/spacy-entity-linker'
depends=(python-spacy)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://github.com/egerber/spaCy-entity-linker/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c984c8286c98f24a0ad2926d84496343ee5a66f1a08b2efdd7aeec97af486f78')

build() {
	cd spaCy-entity-linker-${pkgver}
	python setup.py build
}

package() {
	cd spaCy-entity-linker-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
