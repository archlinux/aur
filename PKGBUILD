# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=orbited
pkgver=0.7.10
pkgrel=3
pkgdesc="A browser(javascript)->tcp bridge; Comet is used to emulate TCP connections in the browser; Allows you to connect a web browser directly to an IRC or XMPP server, for instance."
arch=('any')
url="http://www.orbited.org"
license=('MIT')
depends=(python2-simplejson morbid python2-stomper twisted)
makedepends=(python2-setuptools)
source=(http://pypi.python.org/packages/source/o/orbited/$pkgname-$pkgver.tar.gz)

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's/python2\.5/python2/' start.py
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
}

sha256sums=('71e7627a485fbb6184bb0b4c894ee4dcc74cc970d04888f908d0ca2dec69332d')
