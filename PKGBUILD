# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

_pkgname=spacy
pkgname=python-${_pkgname}
pkgver=3.0.0
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
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6851b74cacf027264c36de40903d4543569196ccaf74ed0c04295666e8e79c50')


build() {
	cd "spacy-${pkgver}"
	python setup.py build
}

package() {
	cd "spacy-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"	
}
