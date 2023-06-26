# Maintainer: Philipp A. <flying-sheep@web.de>
_name=ipynbname
pkgname=python-$_name
pkgver=2023.1.0.0
pkgrel=1
pkgdesc='Retrieve notebook filename and the full path to notebook when run from Jupyter Lab.'
arch=(any)
url="https://github.com/msm1089/$_name"
license=(MIT)
depends=(python-ipykernel python-jupyter_core python-traitlets)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('90bccb6d8a42c4fcd85dbc877de974760040d44084070dedb458644c6faa5e11')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
