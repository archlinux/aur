# Maintainer: Philipp A. <flying-sheep@web.de>

_name=modulegraph
pkgname=python-$_name
pkgver=0.19.7
pkgrel=1
pkgdesc='determines a dependency graph between Python modules primarily by bytecode analysis for import statements'
arch=('any')
url="https://github.com/ronaldoussoren/$_name"
license=(MIT)
depends=(python python-altgraph)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9ad8a81148ba1d90ade66617a153786f7d7cf6a88de83ee28e251183122c2a57')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
