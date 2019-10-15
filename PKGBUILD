_name=plotnine
pkgname=python-$_name
pkgver=0.6.0
pkgrel=2
pkgdesc='A grammar of graphics for python'
arch=(any)
url="https://github.com/has2k1/$_name"
license=(GPL2)
depends=(
	python
	'python-mizani>=0.5.2'
	'python-matplotlib>=3.0.0'
	python-numpy
	'python-scipy>=1.0.0'
	'python-patsy>=0.4.1'
	'python-statsmodels>=0.8.0'
	'python-pandas>=0.23.4'
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
sha256sums=('c271d08edf276f6be09951a4544a1116fc7aa6bc68cadef1b05e29c26ff5f683')

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
