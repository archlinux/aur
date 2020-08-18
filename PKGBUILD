# Maintainer: Philipp A. <flying-sheep@web.de>

_name=nbclean
pkgname=python-$_name
pkgver=0.3.2
pkgrel=2
pkgdesc='Tools for preprocessing and cleaning Jupyter Notebooks.'
arch=(any)
url="https://predictablynoisy.com/$_name"
license=(MIT)
depends=(
	python-nbgrader
	python-numpy
	python-matplotlib
	python-tqdm
	jupyter-nbformat
)
_wheel="${_name/-/_}-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")
sha256sums=('472373d52c7a99e81534057721d5280f8d9435c5636ba232d9b55656eac861b8')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
	chmod 644 "$site/$_name-$pkgver.dist-info/"*
}
