# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=marshmallow-polyfield
pkgname=python-$_pkgname
pkgver=5.11
pkgrel=4
pkgdesc="An extension to marshmallow to allow for polymorphic fields"
arch=(any)
url=https://github.com/Bachmann1234/marshmallow-polyfield
license=(Apache-2.0)
depends=(
    python-marshmallow
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
source=($pkgname-$pkgver.tar.gz::https://github.com/Bachmann1234/$_pkgname/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('507b3dcc20ffb0c0c7fe3b5001e3fb02671d87082305a4f4810ac0363074d10185a2692bd6436e482d1f523b77bd393823644eb0c0139d279dfa1cf322e71c00')

build() {
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
