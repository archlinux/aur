# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=scanpy
pkgver=0.3.1
pkgrel=1
pkgdesc='Single-Cell Analysis in Python'
arch=(x86_64)
provides=(scanpy python-scanpy)
url='https://github.com/theislab/scanpy'
license=(GPL3)
depends=(
	cython
	python-anndata
	python-matplotlib
	python-pandas
	python-scipy
	python-seaborn
	python-psutil
	python-xlrd
	python-h5py
	python-scikit-learn
	python-statsmodels
	python-networkx
	python-igraph
	python-louvain-igraph
	python-natsort
	python-joblib
	python-profilehooks
	python-tqdm)
_wheel="$pkgname-$pkgver-cp36-cp36m-manylinux1_x86_64.whl"
source=("https://files.pythonhosted.org/packages/cp36/${pkgname::1}/$pkgname/$_wheel")
md5sums=('f5fc2324b1e51ef279d8ee101494ecba')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
