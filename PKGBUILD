# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=pypika
pkgname="python-${_pkgname}"
pkgver=0.50.0
pkgrel=1
pkgdesc="A SQL query builder API for Python"
arch=("any")
url="https://github.com/kayak/${_pkgname}"
license=('Apache-2.0')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('7ffa531bbcfb6ee2240e66137291693a401bacf935ecda4ee8ac4d4c4b80af1c06987d82f6ab56a08157a9d13f3fdc3a88c186df83cdf43e8569791c67f9e264')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
