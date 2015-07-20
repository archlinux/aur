# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-schematics
pkgver=1.1.0
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="Python Data Structures for Humans"
url="https://github.com/j2labs/schematics"
makedepends=('python2-setuptools')
provides=('python2-dictshield')
replaces=('python2-dictshield')
license=('BSD')
arch=('any')
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)

build() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
	install -m0644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('176d3906bd0a052cfe0ef3e4cb22a9286b5b3fe12cf494d8b97cddbd1840cf5b')
