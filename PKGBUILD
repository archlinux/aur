# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-finnhub-python
_pkgname=${pkgname:7}
pkgver=2.4.23
pkgrel=1
pkgdesc="Finnhub API"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
makedepends=(python-build python-installer python-setuptools)
depends=(python python-requests)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/finnhub_python-$pkgver.tar.gz)
sha256sums=('47b74f0c994af900a4b1c76376cf5b75d03a33ee3a5ff2c30e3c4472bc834959')

build() {
    cd ${srcdir}/finnhub_python-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/finnhub_python-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
