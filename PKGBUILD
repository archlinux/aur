# Maintainer: Philipp A. <flying-sheep@web.de>

_name=goatools
pkgname=python-$_name
pkgver=1.2.3
pkgrel=2
pkgdesc='Python scripts to find enrichment of GO terms'
arch=(any)
url="https://github.com/tanghaibao/$_name"
license=(BSD)
depends=(python python-pandas python-numpy python-scipy python-xlsxwriter python-statsmodels python-xlrd python-docopt python-pydot python-requests)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1b5635481221e42bf2d8efc4ebdca42cd7696b52f52ce5d32fe3eb29d447cdb2')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
