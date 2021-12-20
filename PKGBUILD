# Maintainer: a821

pkgname=python-hnswlib
pkgver=0.6.0
pkgrel=1
pkgdesc="Header-only C++/python library for fast approximate nearest neighbors"
url="https://github.com/nmslib/hnswlib"
arch=('x86_64')
license=('Apache')
depends=('python-numpy')
makedepends=('python-setuptools' 'pybind11')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4aee311a3c05be1018fb176a00e494438665b45e7c5e337e5276b5add1264d04')

build() {
    cd "${pkgname#python-}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname#python-}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim: set ts=4 sw=4 et:
