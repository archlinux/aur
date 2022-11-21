# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=marshmallow-polyfield
pkgname=python-${_pkgname}
pkgver=5.11
pkgrel=1
pkgdesc="An extension to marshmallow to allow for polymorphic fields"
arch=('any')
url="https://pypi.org/project/marshmallow-polyfield/"
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
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('1d08f9c5c872e397c33f72c073d770155e627924f607772479f8715c58b38b1db02814618a318e733c0392bebb725a4e9efa509df605acdcb9a8df3cc96aacce')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
