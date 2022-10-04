# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-lief
pkgver=0.12.2
pkgrel=1
pkgdesc="Cross-platform library for parsing, modifying, and abstracting binary formats"
arch=('x86_64')
url="https://github.com/lief-project/lief"
license=('Apache')
depends=('python')
makedepends=('cmake' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.zip::https://files.pythonhosted.org/packages/source/l/lief/lief-$pkgver.zip")
sha256sums=('d6fbab6a7cd4c30db83646c893aa4f43b15628e635711c2cf20e9a27be963469')

build() {
	cd "lief-$pkgver"
	PYTHONPATH="$PWD" python -m build --wheel --no-isolation
}

package() {
	cd "lief-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
