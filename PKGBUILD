# Maintainer: Philipp A. <flying-sheep@web.de>
_name=zarr
pkgname=python-zarr
pkgver=3.1.1
pkgrel=1
pkgdesc='An implementation of chunked, compressed, N-dimensional arrays for Python'
arch=(any)
url='https://github.com/zarr-developers/zarr-python'
license=(MIT)
depends=(python-packaging python-numpy python-numcodecs python-crc32c python-typing_extensions python-donfig)
makedepends=(python-hatchling python-hatch-vcs python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('17db72f37f2489452d2137ac891c4133b8f976f9189d8efd3e75f3b3add84e8c')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
