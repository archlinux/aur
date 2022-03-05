# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

_pkgname=spacy
pkgname=python-${_pkgname}
pkgver=3.2.3
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
b2sums=('b378ffbac7326052c4ca5ed0fc1fd8152ab10b060393f36544143c3eab3e2286f12850156fbcee5e2c77b157ab0a0542e0d8edfa381aa16d79e15e15dee8c82f')

build() {
	cd "spacy-${pkgver}"
	python setup.py build
}

package() {
	cd "spacy-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"	
}
