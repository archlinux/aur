# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

_pkgname=spacy
pkgname=python-${_pkgname}
pkgver=3.3.0
pkgrel=1
pkgdesc='Free open-source library for Natural Language Processing in Python'
arch=(x86_64 aarch64)
url='https://spacy.io/'
license=(MIT)
depends=(
	python-catalogue
	python-cymem
	python-jinja
	python-langcodes
	python-murmurhash
	python-numpy
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
b2sums=('9e3e07d66757af51143135149784228256ac831d8f330983225a6e2cf9aab5a582ceae72ea80911d85bf3267dbffd11ba5da1e5575c6c033d46b1d1c56b78a20')

build() {
	cd "spacy-${pkgver}"
	python setup.py build
}

package() {
	cd "spacy-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"	
}
