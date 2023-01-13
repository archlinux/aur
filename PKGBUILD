# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-ulid-py
_pkg="${pkgname#python-}"
pkgver=1.1.0
pkgrel=2
pkgdesc='Universally Unique Lexicographically Sortable Identifier'
arch=('any')
url='https://github.com/ahawker/ulid'
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/u/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('dc6884be91558df077c3011b9fb0c87d1097cb8fc6534b11f310161afd5738f0')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
