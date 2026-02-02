# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=pypika
pkgname="python-${_pkgname}"
pkgver=0.51.0
pkgrel=1
pkgdesc="A SQL query builder API for Python"
arch=("any")
url="https://github.com/kayak/${_pkgname}"
license=('Apache-2.0')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('94c96fba41f3879f8f125a7f7da232e973d364052d9c85a97fe7ada4bdf2ffc0c55b70691a62f3eb394a05a6ce9360856fe1d581fb2f49318d6c317e9faa5a97')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
