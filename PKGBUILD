# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-types-pytz
_pkgname=${pkgname:7}
pkgver=2021.3.6
pkgrel=1
pkgdesc="Typing stubs for pytz"
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(Apache)
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('74547fd90d8d8ab4f1eedf3a344a7d186d97486973895f81221a712e1e2cd993')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
