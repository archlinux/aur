# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Yann Büchau <nobodyinperson@posteo.de>

pkgname=python-xdgspec
_pkg="${pkgname#python-}"
pkgver=0.2.1
pkgrel=1
pkgdesc="XDG Base Directory Specification for Python"
arch=('any')
url="https://gitlab.com/nobodyinperson/python3-xdgspec"
license=('GPL3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/x/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('384d8dba4e033aef83fc72981edb8431db0af89de64f6cc25afe6276e2746413')

build () {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package () {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
