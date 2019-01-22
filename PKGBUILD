# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=scanpy
pkgver=1.3.7
pkgrel=1
pkgdesc='Single-Cell Analysis in Python'
arch=(any)
provides=(scanpy python-scanpy)
url='https://github.com/theislab/scanpy'
license=(BSD)
depends=(
	'python-anndata>=0.6.13'
	'python-matplotlib>=2.2'
	'python-pandas>=0.21'
	python-scipy
	python-seaborn
	python-h5py
	python-pytables
	'python-scikit-learn>=0.19.1'
	python-statsmodels
	python-networkx
	python-natsort
	python-joblib
	'python-numba>=0.40.0'
)

optdepends=(
	'python-multicoretsne: Fast t-SNE'
	'python-louvain-igraph: Louvain clustering'
)
_wheel="$pkgname-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('e9125f0c5758485a7e0cdd13a9b463bae939457f6aa5125d48ab4e3248bdd5b1')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
