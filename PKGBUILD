# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-oauth2
pkgver=1.9.0
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="A fully tested, abstract interface to creating OAuth 1.0 clients and servers"
arch=(any)
url="https://github.com/joestump/python-oauth2"
license=('GPL')
depends=(python2-httplib2)
makedepends=(python2-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.post1.tar.gz)

build() {
	cd "$srcdir/$_libname-$pkgver.post1"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver.post1"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
	rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests
}

sha256sums=('c006a85e7c60107c7cc6da1b184b5c719f6dd7202098196dfa6e55df669b59bf')
