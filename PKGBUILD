# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

_pkgname=spacy
pkgname=python-${_pkgname}
pkgver=3.3.1
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
b2sums=('0a2860392f4e0f5c3ec2ab005a68faea374ff3726994734aefff4a2c44ad3bea541a94411a4b4100a156513469170c6c68337fc31673332e0c963a90824542cf')

build() {
	cd "spacy-${pkgver}"
	python setup.py build
}

package() {
	cd "spacy-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"	
}
