# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-oandapyv20
_pkgname=oandapyV20
pkgver=0.7.2
pkgrel=1
pkgdesc="Python wrapper for the OANDA REST-V20 API"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-requests python-six)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('5ca3990f824d0b16afd49d8e08f7403862d2b3c5a583470f777db7f76f04d073')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
