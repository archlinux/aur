# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=scanpy
pkgver=1.0.1
pkgrel=1
pkgdesc='Single-Cell Analysis in Python'
arch=(any)
provides=(scanpy python-scanpy)
url='https://github.com/theislab/scanpy'
license=(BSD)
depends=(
	'python-anndata>=0.5.8'
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
	python-numba)
optdepends=(python-multicoretsne)
_wheel="$pkgname-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('34eac67035c33f3f392f615fe53622261a613b44d657364973a51a2c947fc94f')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
