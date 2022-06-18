# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=marshmallow-polyfield
pkgname=python-${_pkgname}
pkgver=5.10
pkgrel=2
pkgdesc="An extension to marshmallow to allow for polymorphic fields"
arch=('x86_64')
url="https://github.com/Bachmann1234/marshmallow-polyfield"
license=('Apache')
depends=(
    'python-marshmallow'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Bachmann1234/${_pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('effb3b4f6765f045f54d8f9a6c704664a281012ac5edc0b8c66ea3e12f6246ebb0f7fb4880725c1c8a83a98216b4cc3cc4f07665d5555f4247889471e86e0b0d')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
