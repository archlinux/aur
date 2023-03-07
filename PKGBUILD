# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Gunnar Bretthauer <taijian@posteo.de>

pkgname=python-json-logging
_pkgname=json-logging
pkgver=1.3.0
pkgrel=2
pkgdesc="Python logging library to emit JSON log that can be easily indexed and searched"
url="https://github.com/bobbui/json-logging-python"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/j/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('60a02a1daa168a08aa0a41eeeda63e92500ab08170491bdd326cf00d17f656f8')

build() {
	cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
