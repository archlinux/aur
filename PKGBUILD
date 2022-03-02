# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pygi
pkgver=1.0.3
pkgrel=1
pkgdesc="Command line interface using gitignore.io API"
arch=('any')
url="https://github.com/onlined/pygi"
license=('GPL3')
depends=('python-levenshtein')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pygi/pygi-$pkgver.tar.gz")
sha256sums=('a2a5b5766b219b4643c316417ec8c3a361495e7f745555c9793c45eaad92d1b8')

build() {
	cd "pygi-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "pygi-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
