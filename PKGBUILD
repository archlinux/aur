# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-datetime
_pkgname=DateTime
pkgver=4.7
pkgrel=1
pkgdesc="This package provides a DateTime data type, as known from Zope"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('ZPL')
makedepends=(python-build python-installer python-wheel)
depends=(python python-zope-interface python-pytz)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('7ff7c4a857f08b73db17a85fc54f102d065ad16e7db0133e699c5f1b37e41478')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
