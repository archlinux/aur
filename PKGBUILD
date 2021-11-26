# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-veryprettytable
pkgver=0.8.1
pkgrel=2
pkgdesc='Python library for displaying tabular data'
license=('BSD')
arch=('any')
url="https://github.com/smeggingsmegger/VeryPrettyTable"
depends=('python-colorama' 'python-termcolor')
makedepends=('python-setuptools')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/v/veryprettytable/veryprettytable-$pkgver.tar.gz")
sha256sums=('6e4ca6fc88acae5de13f37ff7d8b130b03c9fadb4947d12b8b0c9b8ebe8b39cc')

build() {
	cd "veryprettytable-$pkgver"
	python setup.py build
}

package() {
	cd "veryprettytable-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
