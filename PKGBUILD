# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=scanpy
pkgver=1.2.2
pkgrel=1
pkgdesc='Single-Cell Analysis in Python'
arch=(any)
provides=(scanpy python-scanpy)
url='https://github.com/theislab/scanpy'
license=(BSD)
depends=(
	'python-anndata>=0.6.2'
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
	python-numba
)
optdepends=(
	'python-multicoretsne: Fast t-SNE'
	'python-louvain-igraph: Louvain clustering'
)
_wheel="$pkgname-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('0bf7f01f5a81cb2e900cc1a6854c19740b1a8de4c28781f5940cf3c0b86295c0')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
