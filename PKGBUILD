# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-tables
_pkgname=${pkgname:7}
pkgver=3.8.0
pkgrel=2
pkgdesc="Hierarchical datasets for Python"
arch=('any')
url="https://pypi.org/project/tables"
license=('BSD')
makedepends=(python-build python-installer python-wheel)
depends=(python hdf5 python-numpy python-oldest-supported-numpy python-numexpr python-packaging)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('34f3fa2366ce20b18f1df573a77c1d27306ce1f2a41d9f9eff621b5192ea8788')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
