# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-cleanurl
pkgver=0.1.8
pkgrel=1
pkgdesc="Removes clutter from URLs"
arch=('any')
url="https://github.com/xojoc/cleanurl"
license=('AGPL3')
depends=('python>=3.9')
makedepends=('python-poetry-core' 'python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/cleanurl/cleanurl-$pkgver.tar.gz")
sha256sums=('db0bc74ac53cb32d12f3be393eac7280bbf6a03b7543e2ea0e403c9a9ada9854')

build() {
	cd "cleanurl-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "cleanurl-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
