# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=scanpy
pkgver=1.4.5.post3
pkgrel=1
pkgdesc='Single-Cell Analysis in Python'
arch=(any)
provides=(scanpy python-scanpy)
url='https://github.com/theislab/scanpy'
license=(BSD)
depends=(
	'python-anndata>=0.6.22'
	'python-matplotlib>=3.0'
	'python-pandas>=0.21'
	'python-scipy>=1.3'
	python-seaborn
	python-h5py
	python-pytables
	python-tqdm
	python-importlib-metadata
	'python-scikit-learn>=0.21.2'
	'python-statsmodels>=0.10.0'
	python-patsy
	python-networkx
	python-natsort
	python-joblib
	'python-numba>=0.41.0'
	'python-umap-learn>=0.3.0'
	python-legacy-api-wrap
	python-setuptools_scm
	python-packaging
)
optdepends=(
	'python-bbknn: Batch balanced KNN (batch correction)'
	'python-leidenalg: leiden community detection'
	'python-multicoretsne: Fast t-SNE'
	'python-louvain-igraph: Louvain clustering'
)
makedepends=(install-wheel-scripts)
_wheel="$pkgname-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('61b7f59fc0037dc653ca4da0c4ff1c5bc763aa894579ce38f04db3eb08376283')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	install -d "$site"
	unzip "$_wheel" -d "$site"
	install-wheel-scripts --prefix="$pkgdir/usr" "$_wheel"
}
