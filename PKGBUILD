# Maintainer: Philipp A. <flying-sheep@web.de>

_name=altgraph
pkgname=python-$_name
pkgver=0.17.5
pkgrel=1
pkgdesc='A graph (network) package for constructing graphs, BFS and DFS traversals, topological sort, shortest paths, etc. with graphviz output.'
arch=(any)
url="https://pypi.python.org/pypi/$_name"
license=(MIT)
depends=(python python-setuptools)  # setuptools for pkg_resources
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c87b395dd12fabde9c99573a9749d67da8d29ef9de0125c7f536699b4a9bc9e7')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-altgraph/LICENSE"
}
