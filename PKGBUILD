# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-bittrex
pkgver=0.3.0
pkgrel=3
pkgdesc='Python bindings for bittrex'
url='https://github.com/ericsomdahl/python-bittrex'
license=('MIT')
arch=('any')
makedepends=('python-setuptools')
checkdepends=('python-requests')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('93c4b440dabeae2b33c3d3cec660001958e0fde8f35b4c294c63fccd9622a579')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
