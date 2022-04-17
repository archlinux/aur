# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Clint Valentine <valentine dot clint at gmail dot com>

pkgname=python-gtfparse
_pkg=gtfparse
pkgver=1.2.1
pkgrel=1
pkgdesc="Python library for parsing GTF files"
arch=('any')
url="https://pypi.python.org/pypi/gtfparse"
license=('Apache')
depends=('python-numpy' 'python-pandas')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('559d4d36b0bd5d4494f925cab3c00cd969783ebb6408fa025df92663965834b8')

build(){
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
