# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-casacore
pkgver=3.4.0
pkgrel=1
pkgdesc="Python bindings for casacore"
arch=('x86_64')
url="https://github.com/casacore/python-casacore"
license=('GPL')
depends=('casacore' 'python-numpy' 'python-argparse' 'python-future' 'python-six')
makedepends=('boost' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=('python-pyrap')
replaces=('python-pyrap')
changelog=
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('f654781292308de70c037981f5f7f5aeb02cf980a6f1367d1c294e7b4fca42ce')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
