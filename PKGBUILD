# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

pkgname=python-thinc
pkgver=8.0.1
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
source=("https://files.pythonhosted.org/packages/ac/15/282edb3e44d67c64d77dd94af9542e26fe7e5256fda8f2242b169bb146b0/thinc-8.0.1.tar.gz")
sha256sums=('88755ccd076184f29ebc29a484347830fd52a29ece58aa611faec8a578a45810')

build() {
	cd "thinc-${pkgver}"
	python setup.py build
}

package() {
	cd "thinc-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"    
}
