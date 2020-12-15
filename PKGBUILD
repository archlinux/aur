# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

pkgname=python-spacy
pkgver=2.3.5
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
source=("https://files.pythonhosted.org/packages/45/71/507b8dbbe3ee6f93c0356c3e5e902e0f598c02d919ad3116e16559eb011f/spacy-2.3.5.tar.gz")
sha256sums=('315278ab60094643baecd866017c7d4cbd966efd2d517ad0e6c888edf7fa5aef')


build() {
	cd "spacy-${pkgver}"
	python setup.py build
}

package() {
	cd "spacy-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"	
}
