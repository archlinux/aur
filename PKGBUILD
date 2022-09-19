# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-docutils-graphviz
pkgver=1.0.3
pkgrel=1
pkgdesc='Graphviz extension for docutils'
arch=('any')
url="https://github.com/liuyug/python-docutils-graphviz"
license=('MIT')
depends=('python-beautifulsoup4' 'python-docutils' 'python-graphviz' 'python-html5lib')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ee141cc12f104fac966373eb3b087a8b97718148d71425b567734133ed033653')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
