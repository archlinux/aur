# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

pkgname=python-spacy
pkgver=2.3.4
pkgrel=1
pkgdesc="Free open-source library for Natural Language Processing in Python"
arch=(i686 x86_64 armv7h aarch64)
url="https://spacy.io/"
license=(MIT)
depends=(
	python-catalogue
	python-cymem
	python-murmurhash
	python-numpy
	python-pathlib
	python-plac
	python-preshed
	python-regex
	python-requests
	python-srsly
	python-thinc
	python-tqdm
	python-ujson
	python-wasabi
)
makedepends=(python-wheel cython)
source=("https://files.pythonhosted.org/packages/73/df/868cb5a40d8649b057594425fe67bffdc732213e6e2fe2ad8ccd2707a918/spacy-2.3.4.tar.gz")
sha256sums=('a5c8805759114aac3a1db1b20f42af1124da5315be903ccb4c472cc8452393fb')


build() {
	cd "spacy-${pkgver}"
	python setup.py build
}

package() {
	cd "spacy-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"	
}
