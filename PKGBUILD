# Maintainer: Philipp A. <flying-sheep@web.de>
_name=zarr
pkgname=python-zarr
pkgver=2.4.0
pkgrel=1
pkgdesc='An implementation of chunked, compressed, N-dimensional arrays for Python'
arch=(any)
url='https://github.com/zarr-developers/zarr'
license=(MIT)
depends=(python-fasteners python-asciitree python-numpy python-numcodecs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('53aa21b989a47ddc5e916eaff6115b824c0864444b1c6f3aaf4f6cf9a51ed608')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
