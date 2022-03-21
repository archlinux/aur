# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-mplfinance
_pkgname=${pkgname:7}
pkgver=0.12.8b9
pkgrel=1
pkgdesc="Utilities for the visualization, and visual analysis, of financial data"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('BSD')
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('7e5adc924ca044620b1aeabd88a85209cacc56b6ddaf376f3ce0492c0cb1434c')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
