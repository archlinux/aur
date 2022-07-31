# Maintainer: a821 <a821 - mail - de>

pkgname=python-numpy-groupies
_name=numpy-groupies
pkgver=0.9.18
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
sha256sums=('ea845a9acb533e3ba011826c48e7abe27dd1895edb3bfa09322bc12803982e1a')

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
