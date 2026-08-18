# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aaron Coach <aur at ezpz dot cz>


_name=pywakeonlan
pkgname=python-wakeonlan
pkgver=4.0.0
pkgrel=1
pkgdesc='Wake on LAN Python module'
url='https://github.com/remcohaszing/pywakeonlan'
arch=('any')
license=('MIT')
depends=('python>=3.7')
makedepends=(python-build python-installer python-poetry-core python-wheel)
source=("$url/archive/$pkgver.tar.gz")
b2sums=('9057d26923cf74251f53b377925bb4fb3f77a9330ef425e2af43621dfaae8ae0620c27bc78302e755052b7e54d2b85de129c11c3bdd441264b10a9a8c507fbec')

build() {
	cd $_name-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
