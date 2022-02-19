# Maintainer: Philipp A. <flying-sheep@web.de>

_name=modulegraph
pkgname=python-$_name
pkgver=0.19.2
pkgrel=2
pkgdesc='determines a dependency graph between Python modules primarily by bytecode analysis for import statements'
arch=('any')
url="https://github.com/ronaldoussoren/$_name"
license=(MIT)
depends=(python python-altgraph)
makedepends=(python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('14c59c10874001aa9c1d527f114870991c0d8dfc6baf6c7e27f885df794a8239')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
