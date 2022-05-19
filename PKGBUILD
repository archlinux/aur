# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

_pkgname=thinc
pkgname=python-${_pkgname}
pkgver=8.0.16
pkgrel=1
pkgdesc='Practical Machine Learning for NLP'
arch=(x86_64 aarch64)
url='https://github.com/explosion/thinc'
license=(MIT)
depends=(
	python-blis
	python-catalogue
	python-cymem
	python-hypothesis
	python-mock
	python-murmurhash
	python-numpy
	python-plac
	python-preshed
	python-pydantic
	python-six
	python-srsly
	python-tqdm
	python-wasabi
)
makedepends=(python-setuptools cython)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('edee5e238be38054d75e0eb12d4461812243afd3d5eb4744b998476feff58ea8edf2ef1de8a70254e522949db07d87c9b00368d60946db35e4a342a8318aa313')

build() {
	cd "thinc-${pkgver}"
	python setup.py build
}

package() {
	cd "thinc-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"    
}
