# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-datetime
_pkgname=DateTime
pkgver=4.9
pkgrel=1
pkgdesc="This package provides a DateTime data type, as known from Zope"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('ZPL')
makedepends=(python-build python-installer python-wheel)
depends=(python python-zope-interface python-pytz)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('29d346bf3ecad5ee1aad74fa2eb03de55fa298434e2f27db6dcaa12a44385681')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
