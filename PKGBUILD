# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-tables
_pkgname=${pkgname:7}
pkgver=3.9.1
pkgrel=3
pkgdesc="Hierarchical datasets for Python"
arch=('any')
url="https://pypi.org/project/tables"
license=('BSD')
makedepends=(python-build python-installer python-wheel)
depends=(python hdf5 python-numpy python-oldest-supported-numpy python-numexpr python-packaging python-blosc2)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('48331503cd509c9f1f95cf2f5c64a57c48c0aa5141423f0eca352965c4f9bf81')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
