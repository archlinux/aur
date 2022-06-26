# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-types-python-dateutil
_pkgname=${pkgname:7}
pkgver=2.8.18
pkgrel=1
pkgdesc="Typing stubs for python-dateutil"
arch=('any')
url="https://github.com/python/typeshed"
license=(Apache)
makedepends=(python-build python-installer python-setuptools python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('8695c7d7a5b1aef4002f3ab4e1247e23b1d41cd7cc1286d4594c2d8c5593c991')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}

