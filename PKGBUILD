# Maintainer: Philipp A. <flying-sheep@web.de>

_name=anndata2ri
pkgname=python-$_name
pkgver=1.1
pkgrel=2
pkgdesc='Converter between Python’s AnnData and R’s SingleCellExperiment.'
arch=(any)
url="https://github.com/theislab/$_name"
license=(GPL3)
depends=(python-anndata python-rpy2 python-tzlocal)
makedepends=(python-hatchling python-hatch-vcs python-installer python-build)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bf5e5d5184efe49eb00f7d524225a9867e3dd77c6ed291eb251168fe4dc429e7')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
