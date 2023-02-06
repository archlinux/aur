_name=plotnine
pkgname=python-$_name
pkgver=0.10.1
pkgrel=1
pkgdesc='A grammar of graphics for python'
arch=(any)
url="https://github.com/has2k1/$_name"
license=(GPL2)
depends=(
	python
	'python-mizani>=0.7.3'
	'python-matplotlib>=3.1.1'
	'python-numpy>=1.19.0'
	'python-scipy>=1.5.0'
	'python-patsy>=0.5.1'
	'python-statsmodels>=0.12.1'
	'python-pandas>=1.1.0'
	'python-descartes>=1.1.0'
)
optdepends=(
	'python-scikit-learn: gaussian process smoothing, kernel density implementation'
	'python-scikit-misc: loess smooting'
)
_pyarch=py3
_wheel="$_name-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
noextract=("$_wheel")
sha256sums=('bac216d71b04ea4e084a529c08716a981fe073c8fcdafa7643043935d7b7fa9d')

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
