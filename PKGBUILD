# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aaron Coach <aur at ezpz dot cz>


_name=pywakeonlan
pkgname=python-wakeonlan
pkgver=3.0.0
pkgrel=2
pkgdesc='Wake on LAN Python module'
url='https://github.com/remcohaszing/pywakeonlan'
arch=('any')
license=('MIT')
depends=('python>=3.7')
makedepends=(python-build python-installer python-poetry-core python-wheel)
source=("$url/archive/$pkgver.tar.gz")
b2sums=('f41e5674b1db4ca9d263e0286e65f5697c45444d35b411f4dba37b71f11588137bb85e24625ccfba5f8154052e15f7b6a0d0c765746c59cb648404774a18ec74')

build() {
	cd $_name-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
