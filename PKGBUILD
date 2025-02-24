# Maintainer: Philipp A. <flying-sheep@web.de>
_name=loompy
pkgname=python-loompy
pkgver=3.0.8
pkgrel=1
pkgdesc='Python implementation of the Loom file format for single-cell RNA-seq data'
arch=(any)
url='http://loompy.org/'
license=(BSD)
depends=(
	python-h5py
	python-scipy
	python-numpy
	python-numba
	python-click
	python-numpy-groupies
)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c1f48d0bf21aa2bbdeee21a0577553cba9609d9435d7c32b687686bbb5869ca7')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
