# Maintainer: Philipp A. <flying-sheep@web.de>

_name=scvelo
pkgname=python-$_name
pkgver=0.1.21
pkgrel=1
pkgdesc='Stochastic Single Cell RNA Velocity'
arch=(any)
url="https://github.com/theislab/$_name"
license=(BSD)
depends=(
	'scanpy>=1.3.3'
	'python-anndata>=0.6.18'
	'python-numpy>=1.14'
	'python-pandas>=0.23.0'
	'python-matplotlib>=2.2'
	'python-umap-learn>=0.3.0'
	'python-loompy>=2.0.12'
	'python-scipy>=1.0'
	'python-scikit-learn>=0.21.2'
	'python-joblib'
	'python-setuptools'
)
_pyarch=py3
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('0eaf59b5d4ca52415c2af380f3c1c1764236efb955022aa4d76c4197856e056d')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
