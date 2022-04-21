# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-finnhub-python
_pkgname=${pkgname:7}
pkgver=2.4.13
pkgrel=1
pkgdesc="Finnhub API"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python python-requests python-future)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('b0704776f24519150965e441c1b01ac48e5f70453a2a4bdbab4f987740810074')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
