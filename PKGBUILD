# Maintainer: Philipp A. <flying-sheep@web.de>

_name=anndata2ri
pkgname=python-$_name
pkgver=1.3.2
pkgrel=1
pkgdesc='Converter between Python’s AnnData and R’s SingleCellExperiment.'
arch=(any)
url="https://github.com/theislab/$_name"
license=(GPL3)
depends=(python-anndata python-rpy2 python-tzlocal)
makedepends=(python-hatchling python-hatch-vcs python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('34a767b16abfac1aacb6edcd394eaf565f53fff6de3e6f47961a3901d3890d93')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
