# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aaron Coach <aur at ezpz dot cz>


_name=pywakeonlan
pkgname=python-wakeonlan
pkgver=3.1.0
pkgrel=1
pkgdesc='Wake on LAN Python module'
url='https://github.com/remcohaszing/pywakeonlan'
arch=('any')
license=('MIT')
depends=('python>=3.7')
makedepends=(python-build python-installer python-poetry-core python-wheel)
source=("$url/archive/$pkgver.tar.gz")
b2sums=('9f9d72ff22879f3040115384fb7ab7fcadfc1470dfeb83970030a6dd0b78e0d26a70e9b65e4bf1adfcc8125092ffeee2ddb2c7ca4e41cdd2df4c1786ec1e5ede')

build() {
	cd $_name-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
