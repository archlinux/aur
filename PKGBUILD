# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-fred
_pkgname=${pkgname:7}
pkgver=3.1
pkgrel=1
pkgdesc="St. Louis Federal Reserve FRED API"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-requests)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('f31327d648917694b8d15d66ca4e82a082dbb88ca027bdcc9d56738cbc836a6a')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
