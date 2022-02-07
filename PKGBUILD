# Maintainer: a821

pkgname=python-hnswlib
pkgver=0.6.1
pkgrel=1
pkgdesc="Header-only C++/python library for fast approximate nearest neighbors"
url="https://github.com/nmslib/hnswlib"
arch=('x86_64')
license=('Apache')
depends=('python-numpy')
makedepends=('python-setuptools' 'pybind11')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e27abe4252344c81d9d2d97fbe8a7be2eef29591d67615870e2a2e31a592edf7')

build() {
    cd "${pkgname#python-}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname#python-}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim: set ts=4 sw=4 et:
