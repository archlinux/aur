# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-lief
pkgver=0.12.1
pkgrel=1
pkgdesc="Cross-platform library for parsing, modifying, and abstracting binary formats"
arch=('x86_64')
url="https://github.com/lief-project/lief"
license=('Apache')
depends=('python')
makedepends=('cmake' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.zip::https://files.pythonhosted.org/packages/source/l/lief/lief-$pkgver.zip")
sha256sums=('4ff4ccfae2e1ee4ccba2b5556027dbb56282b8a973c5835c5b597e8b7b664416')

build() {
	cd "lief-$pkgver"
	PYTHONPATH="$PWD" python -m build --wheel --no-isolation
}

package() {
	cd "lief-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
