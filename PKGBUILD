# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='imgsize'
pkgname="python2-$_pkgname"
pkgver='2.1'
pkgrel='1'
pkgdesc='Pure Python image size library'
arch=('any')
url="https://github.com/ojii/$_pkgname"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a413cc368cac5f5cf9199038887e52ed1ece08f431885dd762dde2df56882f13')

_sourcedirectory="$_pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py install --root="$pkgdir/" -O1 --skip-build
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
