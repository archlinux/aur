# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=scanpy
pkgver=1.3.3
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
sha256sums=('35db9437d042441f75252a8e8dfaca4e6577fb7d6ace264ab9c57ccb5ce3e3bc')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
