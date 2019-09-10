# Maintainer: Philipp A. <flying-sheep@web.de>
_name=zarr
pkgname=python-zarr
pkgver=2.3.2
pkgrel=1
pkgdesc='An implementation of chunked, compressed, N-dimensional arrays for Python'
arch=(any)
url='https://github.com/zarr-developers/zarr'
license=(MIT)
depends=(python-fasteners python-asciitree python-numpy python-numcodecs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c62d0158fb287151c978904935a177b3d2d318dea3057cfbeac8541915dfa105')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
