# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-pyuv
pkgver=1.3.0
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

sha256sums=('eed2ae2136f4640584328ee3de34f436ec4d149306e5d51a2565904521e22570')
