# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-daemon
_libname=${pkgname/python2-/python-}
pkgver=2.0.3
pkgrel=1
pkgdesc="Library to implement a well-behaved Unix daemon process"
license=("PSF")
url="http://pypi.python.org/pypi/python-daemon"
depends=('python2-lockfile')
makedepends=('python2-setuptools' 'python2-docutils')
source=(http://pypi.python.org/packages/source/p/python-daemon/python-daemon-$pkgver.tar.gz)
arch=('any')

build() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
}

sha256sums=('fa17fb81c32f7abefabed978f000b07fa878fed754f97a9675fa17edb325a087')
