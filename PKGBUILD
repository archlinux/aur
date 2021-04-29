# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

_pkgname=spacy
pkgname=python-${_pkgname}
pkgver=3.0.6
pkgrel=1
pkgdesc="Free open-source library for Natural Language Processing in Python"
arch=(x86_64 aarch64)
url="https://spacy.io/"
license=(MIT)
depends=(
	python-catalogue
	python-cymem
	python-jinja
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
	python-typer
	python-ujson
	python-wasabi
)
makedepends=(
	python-pip
	python-wheel
	cython
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('5628ab89f1f568099c880b12a9c37f4ece29ab89260660cfdf728c02711879c5')


build() {
	cd "spacy-${pkgver}"
	python setup.py build
}

package() {
	cd "spacy-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"	
}
