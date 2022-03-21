# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-bt
_pkgname=${pkgname:7}
pkgver=0.2.9
pkgrel=1
pkgdesc="A flexible backtesting framework for Python"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('d162d71aaaaf7265a848d1fc0040f503add32dac2f9f3127bece0d74c22efb9b')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
