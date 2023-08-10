# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pur
_pkgname=${pkgname:7}
pkgver=7.1.1
pkgrel=2
pkgdesc="Update packages in a requirements.txt file to latest versions."
arch=('any')
url="https://pypi.org/project/pur"
license=('BSD license')
makedepends=(python-build python-installer python-wheel)
depends=(python python-click)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('c2849a12ce478e533f71b0f73ba565b725c2d40bdbd881856a8e837cbbec22da')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
