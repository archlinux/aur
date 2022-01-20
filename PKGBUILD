# Maintainer: Yohann D'Anello <ynerant@crans.org>

pkgname=python-spacy-entity-linker
pkgver=1.0
pkgrel=1
pkgdesc='Linked Entity Pipeline for spaCy'
url='https://github.com/egerber/spacy-entity-linker'
depends=(python-spacy)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://github.com/egerber/spaCy-entity-linker/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9ad0551b3e2ee37b384c3cbfb73b14c5776c2dda1a789160ce55aef21db13eed')

build() {
	cd spaCy-entity-linker-${pkgver}
	python setup.py build
}

package() {
	cd spaCy-entity-linker-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
