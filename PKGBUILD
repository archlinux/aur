# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Ronan Pigott <rpigott@berkeley.edu>

pkgname=python-pypresence
pkgver=4.2.1
pkgrel=1
pkgdesc='Discord RPC and Rich Presence wrapper library'
url='https://github.com/qwertyquerty/pypresence'
arch=('any')
license=('BSD')
depends=('python>=3.8')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c18fb3bbe945274ecea57da52e80ea6d3f0349596b18f0815d193b9b878d7dda')

build() {
	cd "pypresence-$pkgver"
	python setup.py build
}

package() {
	cd "pypresence-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
