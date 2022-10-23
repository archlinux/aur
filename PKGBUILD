# Maintainer: a821 <a821 - mail - de>

pkgname=python-numpy-groupies
_name=numpy-groupies
pkgver=0.9.20
pkgrel=1
pkgdesc='Optimised tools for group-indexing operations for python numpy'
arch=("any")
url="https://github.com/ml31415/numpy-groupies"
license=('BSD')
depends=('python-numpy')
makedepends=('python-pytest-runner')
optdepends=(
    'python-numba: for numba backend'
    'python-pandas: for pandas backend'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1c651930de328e88c7cd0685df96a1d8314ec0c9444816f8fbfe6689275e8fd3')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et:
