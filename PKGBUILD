# Maintainer: Philipp A. <flying-sheep@web.de>
_name=ipynbname
pkgname=python-$_name
pkgver=2024.1.0.0
pkgrel=1
pkgdesc='Retrieve notebook filename and the full path to notebook when run from Jupyter Lab.'
arch=(any)
url="https://github.com/msm1089/$_name"
license=(MIT)
depends=(python-ipykernel python-jupyter_core python-traitlets)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1d3c69cdee8a97814f456a7204e9cc195b4bbb4b9e45cbe757796b162493f606')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
