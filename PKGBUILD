# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pyally
_pkgname=${pkgname:7}
pkgver=1.1.2
pkgrel=1
pkgdesc="Ally Invest API Wrapper"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-pandas python-pytz python-requests python-requests-oauthlib)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('d5dba065ddbf18261b83e29e5fffff731d9b03a4278eb9a9333a17f2d1772d4d')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
