# Maintainer: a821 <a821 - mail - de>

pkgname=python-numpy-groupies
pkgver=0.9.11
pkgrel=1
pkgdesc='Optimised tools for group-indexing operations for python numpy'
arch=("any")
url="https://github.com/ml31415/numpy-groupies"
license=('BSD')
depends=('python-numpy')
makedepends=('python-setuptools')
optdepends=(
    'python-numba: for numba backend'
    'python-pandas: for pandas backend'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8824b1ae385daa8d2da125845f7cdc484e31e747bc5f7888cebfea08fe34f78f')

build() {
    cd "${pkgname/python-}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname/python-}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et:
