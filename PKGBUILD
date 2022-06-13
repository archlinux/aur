# Maintainer: Philipp A. <flying-sheep@web.de>
_name=ipynbname
pkgname=python-$_name
pkgver=2021.3.2
pkgrel=1
pkgdesc='Retrieve notebook filename and the full path to notebook when run from Jupyter Lab.'
arch=(any)
url="https://github.com/msm1089/$_name"
license=(MIT)
depends=(python-ipykernel python-jupyter_core python-traitlets)
makedepends=(python-setuptools python-installer python-build)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('cf7bae999005dce012738d09610e69a47acd765797c0365c803f96c21ea2f32b')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
