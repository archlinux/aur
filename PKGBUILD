# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=scanpy
pkgver=1.7.2
pkgrel=1
pkgdesc='Single-Cell Analysis in Python'
arch=(any)
provides=(scanpy python-scanpy)
url='https://github.com/theislab/scanpy'
license=(BSD)
depends=(
	'python-anndata>=0.7.4'
	'python-numpy>=1.17.0'
	'python-matplotlib>=3.1.2'
	'python-pandas>=0.21'
	'python-scipy>=1.4'
	python-seaborn
	python-h5py
	python-pytables
	python-tqdm
	'python-scikit-learn>=0.21.2'
	'python-statsmodels>=0.10.0'
	python-patsy
	'python-networkx>=2.3'
	python-natsort
	python-joblib
	'python-numba>=0.41.0'
	'python-umap-learn>=0.3.0'
	python-legacy-api-wrap
	python-packaging
	python-sinfo
)
optdepends=(
	'python-bbknn: Batch balanced KNN (batch correction)'
	'python-leidenalg: leiden community detection'
	'python-multicoretsne: Fast t-SNE'
	'python-louvain-igraph: Louvain clustering'
)
makedepends=(install-wheel-scripts python-setuptools-scm python-pytoml)
_wheel="$pkgname-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('68912549d9108d8f22fddada9f5deb51b5ec4637420fb80b9e15341bf03db650')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	install -d "$site"
	unzip "$_wheel" -d "$site"
	install-wheel-scripts --prefix="$pkgdir/usr" "$_wheel"
}
