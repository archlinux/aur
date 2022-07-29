# Maintainer: Philipp A. <flying-sheep@web.de>
_name=zarr
pkgname=python-zarr
pkgver=2.12.0
pkgrel=1
pkgdesc='An implementation of chunked, compressed, N-dimensional arrays for Python'
arch=(any)
url='https://github.com/zarr-developers/zarr-python'
license=(MIT)
depends=(python-asciitree python-numpy python-fasteners 'python-numcodecs>=0.6.4')
makedepends=(python-setuptools python-setuptools-scm python-installer python-build)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('515a31ee4bad6bb48ae05178c588ae49a02a35defa01dd9a3293306903368165')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
