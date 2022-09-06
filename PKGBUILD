# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=scanpy-scripts
pkgver=1.1.6
pkgrel=1
pkgdesc='Scripts for using scanpy from the command line'
arch=(any)
url='https://github.com/ebi-gene-expression-group/scanpy-scripts'
license=(MIT)
depends=(scanpy python-click)
makedepends=(python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('1701e35f93f5370ab451760b3892caf01b46d2898c3dd149e1dcba602e45eea1')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
