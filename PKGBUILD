# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=scanpy-scripts
pkgver=1.9.301
pkgrel=1
pkgdesc='Scripts for using scanpy from the command line'
arch=(any)
url='https://github.com/ebi-gene-expression-group/scanpy-scripts'
license=(MIT)
depends=(scanpy python-click)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('c681d9cf5670d8b771b7327684f19d52f9661ee31e685241af4d960220a5d63b')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
