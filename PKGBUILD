# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=scanpy-scripts
pkgver=1.1.3
pkgrel=2
pkgdesc='Scripts for using scanpy from the command line'
arch=(any)
url='https://github.com/ebi-gene-expression-group/scanpy-scripts'
license=(MIT)
depends=(scanpy python-click)
makedepends=(python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('96eb39bedb5cd075509247d770cfd951e57f2834248bf1e6896c55e7fe2c524f')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
