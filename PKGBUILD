# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-schematics
pkgver=1.0.2
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

sha256sums=('0e1cff6f9da38fe7958ba2eaf88e6d295e59ad19ed20d67700459824e22a44bd')
