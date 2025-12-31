# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-finnhub-python
_pkgname=${pkgname:7}
pkgver=2.4.26
pkgrel=1
pkgdesc="Finnhub API"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
makedepends=(python-build python-installer python-setuptools)
depends=(python python-requests)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/finnhub_python-$pkgver.tar.gz)
sha256sums=('826abfad1c4692f278358c799c8b1608dbf33c9bc2be4be018b9d9b944fc822c')

build() {
    cd ${srcdir}/finnhub_python-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/finnhub_python-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
