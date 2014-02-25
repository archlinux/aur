# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-oauth2
pkgver=1.5.211
pkgrel=2
_libname=${pkgname/python2-/}
pkgdesc="A fully tested, abstract interface to creating OAuth 1.0 clients and servers"
arch=(any)
url="https://github.com/simplegeo/python-oauth2"
license=('GPL')
depends=(python2-httplib2)
makedepends=(python2-setuptools)
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)

build() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
	rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests
}

sha256sums=('82a38f674da1fa496c0fc4df714cbb058540bed72a30c50a2e344b0d984c4d21')
