# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pur
_pkgname=${pkgname:7}
pkgver=7.1.0
pkgrel=2
pkgdesc="Update packages in a requirements.txt file to latest versions."
arch=('any')
url="https://pypi.org/project/pur"
license=('BSD license')
makedepends=(python-build python-installer python-wheel)
depends=(python python-click)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('2d172c261e06dbf709761e120f80b32e49e7e759062e983c21b9241b34403b5a')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
