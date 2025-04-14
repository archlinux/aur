# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=pypika
pkgname="python-${_pkgname}"
pkgver=0.49.0
pkgrel=1
pkgdesc="A SQL query builder API for Python"
arch=("any")
url="https://github.com/kayak/${_pkgname}"
license=('Apache-2.0')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('f5eba14961a9bde1d5708e3ca0ee08750f9fea124bcb2e841e11b0820bb1169cbb08b4f2e27d07d289505655043fcfc0eedafb30b7e8876014a4794b309f1510')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
