# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dean Galvin <deangalvin3@gmail.com>

pkgname=python-vincenty
_pkg="${pkgname#python-}"
pkgver=0.1.4
pkgrel=2
pkgdesc="Calculates geographical distance between 2 points with extreme accuracy"
url="https://github.com/maurycyp/vincenty"
license=('Unlicense')
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/v/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('eaa2f2de835f369cbd71c1a01ccd4e0d412da0f4aeef7c9692242b9ce182785a')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
