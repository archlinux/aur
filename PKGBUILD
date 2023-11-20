# Maintainer: Phil Schaf <flying-sheep@web.de>
_name=jupyter_kernel_test
pkgname=python-$_name
pkgver=0.6.0
pkgrel=1
pkgdesc='A tool for testing Jupyter kernels'
arch=('any')
url="https://github.com/jupyter/$_name"
license=(BSD3)
depends=(python python-jupyter-client python-jsonschema)
makedepends=(python-hatchling python-installer python-build)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('55c98673703f6f45d25bb7f587f225420b942cb2146674fab2ab06e485f03c5d')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
