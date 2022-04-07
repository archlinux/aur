# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michael Spradling <mike@mspradling.com>

pkgname=python-easypysmb
_pkg=easypysmb
pkgver=1.4.4
pkgrel=1
pkgdesc='Easy to use PySMB wrapper library'
arch=('any')
license=('GPL3')
url='https://github.com/pschmitt/easypysmb'
depends=('python-pysmb' 'python-pyasn1')
makedepends=('python-build' 'python-installer' 'python-poetry')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/e/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('48111dc3c06535e6f20609e58373ab002b790762ad34296311d2f9dc12866786')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
