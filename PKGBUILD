# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-casacore
pkgver=3.5.0
pkgrel=1
pkgdesc="Python bindings for casacore"
arch=('x86_64')
url="https://github.com/casacore/python-casacore"
license=('LGPL3')
depends=('casacore' 'python-numpy' 'python-argparse' 'python-future' 'python-six')
makedepends=('boost' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=('python-pyrap')
replaces=('python-pyrap')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('47ac85d47051074d64415414212c8c2cfcb49a2037f5c3d78f71ab5b162d1e8b')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
