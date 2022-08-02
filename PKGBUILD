# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-casacore
pkgver=3.5.1
pkgrel=1
pkgdesc="Python bindings for casacore"
arch=('x86_64')
url="https://github.com/casacore/python-casacore"
license=('LGPL3')
depends=('casacore' 'python-argparse' 'python-future' 'python-numpy' 'python-six')
makedepends=('boost' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('python-pyrap')
replaces=('python-pyrap')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('a577233c7311f64a8048180ee82d6946fee16e0dce2976eb516784a32d8b9133')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
