# Maintainer: Philipp A. <flying-sheep@web.de>

_name=scvelo
pkgname=python-$_name
pkgver=0.3.3
pkgrel=1
pkgdesc='Stochastic Single Cell RNA Velocity'
arch=(any)
url="https://github.com/theislab/$_name"
license=(BSD)
depends=(
	'python-anndata>=0.7.5'
	'scanpy>=1.5'
	'python-loompy>=2.0.12'
	'python-umap-learn>=0.3.10'
	'python-numba>=0.41.0'
	'python-numpy>=1.17'
	'python-scipy>=1.4.1'
	'python-pandas>=1.4.1'
	'python-scikit-learn>=0.21.2'
	'python-matplotlib>=3.3.0'
)
makedepends=(python-setuptools python-setuptools-scm python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9383a8712f81f0f2d2f1bddcfc81889ede06a0027de537b5b9af83ed821390c7')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
