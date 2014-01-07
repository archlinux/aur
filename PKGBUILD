# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-pyuv
pkgver=0.11.2
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="A Python module which provides an interface to libuv."
url="https://crate.io/packages/pyuv/"
license=('MIT')
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('libuv')
source=("$_libname-$pkgver.tar.gz::https://github.com/saghul/pyuv/archive/release-$pkgver.tar.gz")

build() {
	cd "$srcdir/$_libname-release-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-release-$pkgver"
	python2 setup.py install --root="$pkgdir"
	install -m0644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('9fa25544551e8e4a245f0f2984a90af3cd921069f8b799561b41bf9eff4a4d3d')
