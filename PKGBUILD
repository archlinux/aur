# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-pyuv
pkgver=1.0.1
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="A Python module which provides an interface to libuv."
url="https://crate.io/packages/pyuv/"
license=('MIT')
arch=('i686' 'x86_64')
depends=('python2' 'libuv')
source=("https://github.com/saghul/pyuv/archive/$_libname-$pkgver.tar.gz")

build() {
	cd "$srcdir"/$_libname-$_libname-$pkgver
	python2 setup.py build_ext --use-system-libuv
}

package() {
	cd "$srcdir"/$_libname-$_libname-$pkgver
	python2 setup.py install --skip-build --root="$pkgdir"
	install -m0644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('061ad7b49824e52b6f3199a54a536ee099cddd12254809bf16ae7dfdcd7b4ef2')
