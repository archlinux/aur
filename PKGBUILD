# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-encutils
pkgver=0.9
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="Encoding detection collection for Python."
url="http://cthedot.de/encutils/"
license=(LGPL3 CCPL)
depends=('python2')
arch=('any')
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.zip)

build() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install -O1 --root="$pkgdir"
}

sha256sums=('819f214baf5983556ac3d59878e60ee2d05879a22c004037144c43b43cb4f1e7')
