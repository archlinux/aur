# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-daemon
_libname=${pkgname/python2-/python-}
pkgver=1.6
pkgrel=3
pkgdesc="Library to implement a well-behaved Unix daemon process"
license=("PSF-2+")
url="http://pypi.python.org/pypi/python-daemon"
depends=('python2-lockfile')
makedepends=('python2-setuptools')
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

sha256sums=('1665fb16bfeae72f16aa2de40bc75661458bd42731a7d463a911a8d5eaf96c0b')
