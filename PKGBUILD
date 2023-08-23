# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pur
_pkgname=${pkgname:7}
pkgver=7.3.0
pkgrel=1
pkgdesc="Update packages in a requirements.txt file to latest versions."
arch=('any')
url="https://pypi.org/project/pur"
license=('BSD license')
makedepends=(python-build python-installer python-wheel)
depends=(python python-click)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('9fd7ac8f66477e4c8b2038b51ac392e6f8463aed1552e5e969516d736bf62e45')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
