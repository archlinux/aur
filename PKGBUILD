_name=plotnine
pkgname=python-$_name
pkgver=0.3.0
pkgrel=1
pkgdesc='A grammar of graphics for python'
arch=(any)
url="https://github.com/has2k1/$_name"
license=(GPL2)
depends=(
	python
	python-numpy
	python-six
	'python-matplotlib>=2.1.0'
	'python-mizani>=0.4.1'
	'python-pandas>=0.21.0'
	'python-patsy>=0.4.1'
	'python-scipy>=1.0.0'
	'python-statsmodels>=0.8.0'
)
makedepends=(python-pip)
_wheel="$_name-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")
noextract=("$_wheel")
sha256sums=('ed18a7e9f30b685f383f252dd844492a667cc567d06ebf5e9688b941316161ca')

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
