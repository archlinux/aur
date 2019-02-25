# Maintainer: Philipp A. <flying-sheep@web.de>
_name=qgrid
pkgname=python-$_name
pkgver=1.1.1
pkgrel=1
pkgdesc='An Interactive Grid for Sorting and Filtering DataFrames in Jupyter Notebook'
arch=(any)
url='https://github.com/quantopian/qgrid'
license=(Apache)
depends=(jupyter-notebook python-pandas python-ipywidgets)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('98cb1184bd53b9cb27ef88d1b8f3f282a328760357281c402d4c53ac277d1c6b')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
