# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-pyuv
pkgver=0.11.1
pkgrel=1
_libname=${pkgname/python-/}
pkgdesc="A Python module which provides an interface to libuv."
url="https://crate.io/packages/pyuv/"
license=('MIT')
arch=('i686' 'x86_64')
depends=('python')
makedepends=('libuv')
source=("$_libname-$pkgver.tar.gz::https://github.com/saghul/pyuv/archive/release-$pkgver.tar.gz")

build() {
	cd "$srcdir/$_libname-release-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_libname-release-$pkgver"
	python setup.py install --root="$pkgdir"
	install -m0644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('b432d35985ba289454785d7a25dae335d16cd2bb1705d86d3a8f240225b67a57')
