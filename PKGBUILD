_name=plotnine
pkgname=python-$_name
pkgver=0.5.1
pkgrel=1
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
makedepends=(python-pip)
optdepends=(
	'python-scikit-learn: gaussian process smoothing, kernel density implementation'
	'python-scikit-misc: loess smooting'
)
_wheel="$_name-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")
noextract=("$_wheel")
sha256sums=('0d8b44a6e433a9303231f2d402c5b898f50c04809a2fee8e393dc79a2d8d762d')

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
