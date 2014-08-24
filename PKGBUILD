# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-pyuv
pkgver=0.11.5
pkgrel=1
_libname=${pkgname/python-/}
pkgdesc="A Python module which provides an interface to libuv."
url="https://crate.io/packages/pyuv/"
license=('MIT')
arch=('i686' 'x86_64')
depends=('python')
makedepends=('libuv')
source=("https://github.com/saghul/pyuv/archive/$_libname-$pkgver.tar.gz")

build() {
	cd "$srcdir"/$_libname-$_libname-$pkgver
	python setup.py build
}

package() {
	cd "$srcdir"/$_libname-$_libname-$pkgver
	python setup.py install --root="$pkgdir"
	install -m0644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('c251952cb4e54c92ab0e871decd13cf73d11ca5dba9f92962de51d12e3a310a9')
