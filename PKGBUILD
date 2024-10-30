# Maintainer: Phil Schaf <flying-sheep@web.de>
_name=jupyter_kernel_test
pkgname=python-$_name
pkgver=0.7.0
pkgrel=1
pkgdesc='A tool for testing Jupyter kernels'
arch=('any')
url="https://github.com/jupyter/$_name"
license=(BSD3)
depends=(python python-jupyter-client python-jsonschema)
makedepends=(python-hatchling python-installer python-build)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('078b6fe7f770dd164f9549bdd7a355663225a3ff9b0f7575ad546d27239ec609')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
