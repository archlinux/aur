# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-mplfinance
_pkgname=${pkgname:7}
pkgver=0.12.10b0
pkgrel=1
pkgdesc="Utilities for the visualization, and visual analysis, of financial data"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('BSD')
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('7da150b5851aa5119ad6e06b55e48338b619bb6773f1b85df5de67a5ffd917bf')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
