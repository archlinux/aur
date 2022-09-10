# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-datetime
_pkgname=DateTime
pkgver=4.6
pkgrel=1
pkgdesc="This package provides a DateTime data type, as known from Zope"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('ZPL')
makedepends=(python-build python-installer python-wheel)
depends=(python python-zope-interface python-pytz)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('9743bfc4da3bc86011d6678e6ad173e9d81ac80996d971a542a3cdb3fe7818eb')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
