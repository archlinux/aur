# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-finnhub-python
_pkgname=${pkgname:7}
pkgver=2.4.12
pkgrel=1
pkgdesc="Finnhub API"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python python-requests python-future)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('2647ccb09ed85dc51da622b2bebd069b41c67049813f68acb92b1e9d4dd05e70')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
