# Maintainer: Philipp A. <flying-sheep@web.de>
_name=zarr
pkgname=python-zarr
pkgver=2.2.0 
pkgrel=1
pkgdesc='An implementation of chunked, compressed, N-dimensional arrays for Python'
arch=(any)
url='https://github.com/zarr-developers/zarr'
license=(MIT)
depends=(python-fasteners python-asciitree python-numpy python-numcodecs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('678eba19c4ba5821e8d0f64cc59eeaf9b86db5b2229836903687794756dce407')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
