# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Guillaume Dott <guillaume+github at dott dot fr>

pkgname=python-pysonic
_pkg=py-sonic
pkgver=1.0.0
pkgrel=1
pkgdesc='Python library to wrap the Subsonic REST API'
arch=('any')
url="https://github.com/crustymonkey/py-sonic"
license=('GPL3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('f61a3417991fef8a42b0bba3c0bb7ea54f88931bbbd3f924f963fb9670fb0a21')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
