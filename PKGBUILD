# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=scanpy
pkgver=0.4.4
pkgrel=1
pkgdesc='Single-Cell Analysis in Python'
arch=(x86_64)
provides=(scanpy python-scanpy)
url='https://github.com/theislab/scanpy'
license=(GPL3)
depends=(
	cython
	'python-anndata>=0.5'
	'python-pandas>=0.21'
	'python-scikit-learn>=0.19.1'
	python-scipy
	python-statsmodels
	python-matplotlib
	python-seaborn
	python-psutil
	python-xlrd
	python-h5py
	python-networkx
	python-louvain-igraph
	python-natsort
	python-joblib
	python-profilehooks
)
optdepends=(
	'python-umap-learn: UMAP dimension reduction'
)
_wheel="$pkgname-$pkgver-cp36-cp36m-manylinux1_x86_64.whl"
source=("https://files.pythonhosted.org/packages/cp36/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('c89b8c05c321f6e75997c6ff8172159fe773cc10bdf1fcb9c8c09596eb1aecf9')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
