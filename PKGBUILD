# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-datetime
_pkgname=DateTime
pkgver=5.1
pkgrel=1
pkgdesc="This package provides a DateTime data type, as known from Zope"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('ZPL')
makedepends=(python-build python-installer python-wheel)
depends=(python python-zope-interface python-pytz)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('a4191a3193c1ca4dbbaad5c958f940b9256864ba2613a53038d1613d3f63262d')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
