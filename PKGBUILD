# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-stomp.py
_libname=${pkgname/python2-/}
pkgver=4.0.14
pkgrel=1
pkgdesc="Python2 STOMP client, supporting versions 1.0, 1.1 and 1.2 of the protocol"
arch=(any)
url="https://github.com/jasonrbriggs/stomp.py"
license=(Apache)
depends=(python2)
source=(https://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)

build() {
	cd "$srcdir"/$_libname-$pkgver
	python2 setup.py build
}

package() {
	cd "$srcdir"/$_libname-$pkgver
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
	install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('a538ce434ccc73efc348f37912bde75da73b936b5f3c71734bc744d5a94ee6fb')
