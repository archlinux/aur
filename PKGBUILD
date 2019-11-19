# Maintainer: Philipp A. <flying-sheep@web.de>
_name=numcodecs
pkgname=python-numcodecs
pkgver=0.6.4
pkgrel=1
pkgdesc='A Python package providing buffer compression and transformation codecs for use in data storage and communication applications'
arch=(any)
url='https://github.com/alimanfoo/numcodecs'
license=(MIT)
depends=(cython python-numpy python-msgpack)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ef4843d5db4d074e607e9b85156835c10d006afc10e175bda62ff5412fca6e4d')

package() {
	cd "$srcdir/$_name-$pkgver"
	CFLAGS="$CFLAGS -msse2 -mavx2" python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
