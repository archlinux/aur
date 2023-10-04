# Maintainer: a821 <a821 - mail - de>

pkgname=python-numpy-groupies
_name=numpy-groupies
pkgver=0.10.2
pkgrel=1
pkgdesc='Optimised tools for group-indexing operations for python numpy'
arch=("any")
url="https://github.com/ml31415/numpy-groupies"
license=('BSD')
depends=('python-numpy')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
optdepends=(
    'python-numba: for numba backend'
    'python-pandas: for pandas backend'
)
_commit=162fdb9bcf32c8748c264b513d15eb9390b498a6
source=("git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
    cd "${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et:
