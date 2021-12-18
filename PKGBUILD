# Maintainer: Philipp A. <flying-sheep@web.de>
_name=numcodecs
pkgname=python-numcodecs
pkgver=0.9.1
pkgrel=1
pkgdesc='A Python package providing buffer compression and transformation codecs for use in data storage and communication applications'
arch=(any)
url="https://github.com/zarr-developers/$_name"
license=(MIT)
depends=(python-numpy python-msgpack)
makedepends=(cython)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('35adbcc746b95e3ac92e949a161811f5aa2602b9eb1ef241b5ea6f09bb220997')

package() {
	cd "$srcdir/$_name-$pkgver"
	export CFLAGS="$CFLAGS -msse2 -mavx2"
	python setup.py install --root="$pkgdir" --optimize=1
}
