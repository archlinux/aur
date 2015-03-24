# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-stomp.py
_libname=${pkgname/python-/}
pkgver=4.0.15
pkgrel=1
pkgdesc="Python STOMP client, supporting versions 1.0, 1.1 and 1.2 of the protocol"
arch=(any)
url="https://github.com/jasonrbriggs/stomp.py"
license=(Apache)
depends=(python)
source=(https://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)

build() {
	cd "$srcdir"/$_libname-$pkgver
	python setup.py build
}

package() {
	cd "$srcdir"/$_libname-$pkgver
	python setup.py install -O1 --skip-build --root="$pkgdir"
	install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('22ad080ad2a8b11bfcac8dbf6f4a0b0780a0e4eb742be85008a5ae359ce4e5f2')
