# Maintainer: Phil Schaf <flying-sheep@web.de>
_name=jupyter_kernel_test
pkgname=python-$_name
pkgver=0.4.3
pkgrel=3
pkgdesc='A tool for testing Jupyter kernels'
arch=('any')
url="https://github.com/jupyter/$_name"
license=(BSD3)
depends=(python python-jupyter_client python-jsonschema)
makedepends=(python-setuptools python-installer python-build)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7af255ce61309e2c08709abaf6c7cea5de3125a8eb33aea166997f99487ff434')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
