# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-finnhub-python
_pkgname=${pkgname:7}
pkgver=2.4.25
pkgrel=1
pkgdesc="Finnhub API"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
makedepends=(python-build python-installer python-setuptools)
depends=(python python-requests)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/finnhub_python-$pkgver.tar.gz)
sha256sums=('b6a73e7cf8fc0859430c647a0c7c9487b036be33c77ecb019ecc422227204083')

build() {
    cd ${srcdir}/finnhub_python-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/finnhub_python-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
