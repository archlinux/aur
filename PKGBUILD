# Maintainer: Phil Schaf <flying-sheep@web.de>
_name=jupyter_kernel_test
pkgname=python-$_name
pkgver=0.4.5
pkgrel=1
pkgdesc='A tool for testing Jupyter kernels'
arch=('any')
url="https://github.com/jupyter/$_name"
license=(BSD3)
depends=(python python-jupyter_client python-jsonschema)
makedepends=(python-hatchling python-installer python-build)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('02173243b862d77291a2486f877a0bbf109a21bb5d2cb889a5db5d1058b7368a')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
