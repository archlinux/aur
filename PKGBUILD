# Maintainer: Philipp A. <flying-sheep@web.de>

_name=modulegraph
pkgname=python-$_name
pkgver=0.19.6
pkgrel=1
pkgdesc='determines a dependency graph between Python modules primarily by bytecode analysis for import statements'
arch=('any')
url="https://github.com/ronaldoussoren/$_name"
license=(MIT)
depends=(python python-altgraph)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c914c8c95a0e10fe88505d4e9c2284b4e3dbc70943e306cc6567e36cc541bf4b')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
