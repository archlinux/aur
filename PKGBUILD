# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

pkgname=python-thinc
pkgver=7.4.5
pkgrel=1
pkgdesc="Practical Machine Learning for NLP"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/explosion/thinc"
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
source=("https://files.pythonhosted.org/packages/8a/ee/e0ebaafb9d290a989d3ca433e118cbba5ec3304c26db41f696b9bfea007e/thinc-7.4.5.tar.gz")
sha256sums=('5743fde41706252ec6ce4737c68d3505f7e1cc3d4431174a17149838d594f8cb')

build() {
	cd "thinc-${pkgver}"
	python setup.py build
}

package() {
	cd "thinc-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"    
}
