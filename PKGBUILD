# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=scanpy
pkgver=1.4.3
pkgrel=1
pkgdesc='Single-Cell Analysis in Python'
arch=(any)
provides=(scanpy python-scanpy)
url='https://github.com/theislab/scanpy'
license=(BSD)
depends=(
	'python-anndata>=0.6.15'
	'python-matplotlib>=3.0'
	'python-pandas>=0.21'
	python-scipy
	python-seaborn
	python-h5py
	python-pytables
	python-tqdm
	'python-scikit-learn>=0.19.1'
	python-statsmodels
	python-patsy
	python-networkx
	python-natsort
	python-joblib
	'python-numba>=0.41.0'
	'python-umap-learn>=0.3.0'
)

optdepends=(
	'python-bbknn: Batch balanced KNN (batch correction)'
	'python-leidenalg: leiden community detection'
	'python-multicoretsne: Fast t-SNE'
	'python-louvain-igraph: Louvain clustering'
)
_wheel="$pkgname-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('4da3b34deed62a94e6456bfff261200cd816a08cacd677369275e091ed536e6d')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
