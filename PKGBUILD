# Maintainer: Diaz <muhammaddiaznurfarizki@gmail.com>
pkgname=python-material-color-utilities-cpp
_name=material-color-utilities
pkgver=0.2.6
pkgrel=1
pkgdesc="Theme color library for Material You (C++/pybind11 implementation by RuurdBijlsma; not to be confused with the unrelated, unmaintained pure-Python python-material-color-utilities package)"
arch=('x86_64')
url="https://github.com/RuurdBijlsma/material-color-utilities"
license=('Apache-2.0')
depends=('python' 'python-numpy' 'python-pillow' 'gcc-libs')
makedepends=('cmake' 'ninja' 'pybind11' 'python-scikit-build-core' 'python-build' 'python-installer')
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/m/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('40840387817eea3ac3a5f5fb9928583ff5bcfd070c83097efe5e77b62e098102')

build() {
    cd "${_name//-/_}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name//-/_}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
