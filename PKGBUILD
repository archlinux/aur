# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-schematics
pkgver=1.0_0
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="Python Data Structures for Humans"
url="https://github.com/j2labs/schematics"
makedepends=('python2-setuptools')
provides=('python2-dictshield')
replaces=('python2-dictshield')
license=('BSD')
arch=('any')
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-${pkgver//_/-}.tar.gz)

build() {
	cd "$srcdir/$_libname-${pkgver//_/-}"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-${pkgver//_/-}"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
	install -m0644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('5d4e4a48e8d9487858af04b4ac62a19c23f9e9355f196bb9f75cce04096cec19')
