# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-brubeck
pkgver=0.4.0
pkgrel=3
_libname=${pkgname/python2-/}
pkgdesc="A coroutine oriented web framework featuring: Mongrel2, Gevent (or Eventlet), ZeroMQ and DictShield."
url="http://brubeck.io/"
makedepends=('python2-setuptools')
depends=('python2-dictshield' 'python2-ujson' 'mongrel2')
optdepends=(
	'python2-gevent'
	'python2-eventlet'
)
license=('BSD')
arch=('any')
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz LICENSE)

build() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
	install -m0644 -D "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('0bc89536c60983841773f63ce158e30262585c4e1a67615cb1041c732c2e5957'
            '24ed653715a99ef7ece91d99c6399544cfa76cb0cce334428daf6ef63b658e12')
