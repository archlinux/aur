# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-setproctitle
pkgver=1.1.7
pkgrel=1
_libname=${pkgname/python-/}
pkgdesc="Allows a python process to change its process title"
license=("BSD")
url="http://code.google.com/p/py-setproctitle/"
depends=('python')
source=("http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz")
arch=('i686' 'x86_64')
options=(!emptydirs)

build() {
    cd "$srcdir/$_libname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_libname-$pkgver"
    python setup.py install -O1 --root="$pkgdir"
	install -m0644 -D COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}

sha256sums=('c7fca7ca317e309f4d77649ed94ef296e30f8444a9fa75bfb6483b5e70efa882')
