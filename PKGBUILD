# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-pyuv
pkgver=1.1.0
pkgrel=1
_libname=${pkgname/python-/}
pkgdesc="A Python module which provides an interface to libuv."
url="https://crate.io/packages/pyuv/"
license=('MIT')
arch=('i686' 'x86_64')
depends=('python' 'libuv')
source=("https://github.com/saghul/pyuv/archive/$_libname-$pkgver.tar.gz")

build() {
	cd "$srcdir"/$_libname-$_libname-$pkgver
	python setup.py build_ext --use-system-libuv
}

package() {
	cd "$srcdir"/$_libname-$_libname-$pkgver
	python setup.py install --skip-build --root="$pkgdir"
	install -m0644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('6344a0ad2d00c9b5d26ee84ae0ffdbd46712eb2f8a9ed8105c86d9619a4268b8')
