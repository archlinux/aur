# Maintainer: Philipp A. <flying-sheep@web.de>

_name=altgraph
pkgname=python-$_name
pkgver=0.17.4
pkgrel=1
pkgdesc='A graph (network) package for constructing graphs, BFS and DFS traversals, topological sort, shortest paths, etc. with graphviz output.'
arch=(any)
url="https://pypi.python.org/pypi/$_name"
license=(MIT)
depends=(python python-setuptools)  # setuptools for pkg_resources
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1b5afbb98f6c4dcadb2e2ae6ab9fa994bbb8c1d75f4fa96d340f9437ae454406')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-altgraph/LICENSE"
}
