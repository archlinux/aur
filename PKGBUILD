# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=python-graph-genus
_name=graph_genus
pkgver=0.1.1
pkgrel=1
pkgdesc='Python/SageMath interface for computing the genus of a graph'
arch=(x86_64)
url="https://github.com/SanderGi/Genus"
license=(GPL-2.0-or-later)
depends=(python)
makedepends=(python-build python-installer python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('df0e4a164ca5b25f661c44e22c1ee88d950d63e405881e61c251b4c52d4d9cd0')

build() {
	cd $_name-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
