# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-tables
_pkgname=${pkgname:7}
pkgver=3.7.0
pkgrel=2
pkgdesc="Hierarchical datasets for Python"
arch=('any')
url="https://pypi.org/project/tables"
license=('BSD')
makedepends=(python-build python-installer python-wheel)
depends=(python hdf5 python-numpy python-oldest-supported-numpy python-numexpr python-packaging)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('e92a887ad6f2a983e564a69902de4a7645c30069fc01abd353ec5da255c5e1fe')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
