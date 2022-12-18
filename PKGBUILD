# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-types-python-dateutil
_pkgname=${pkgname:7}
pkgver=2.8.19.5
pkgrel=1
pkgdesc="Typing stubs for python-dateutil"
arch=('any')
url="https://github.com/python/typeshed"
license=(Apache)
makedepends=(python-build python-installer python-setuptools python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('ab91fc5f715f7d76d9a50d3dd74d0c68dfe38a54f0239cfa0506575ae4d87a9d')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}

