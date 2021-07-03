# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

_pkgname=thinc
pkgname=python-${_pkgname}
pkgver=8.0.7
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
	python-pathlib
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
sha256sums=('7c4382f22a5a3864b88cafe6e64f7a69f64b32147575b5f1e6f2211a8adb11f9')

build() {
	cd "thinc-${pkgver}"
	python setup.py build
}

package() {
	cd "thinc-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"    
}
