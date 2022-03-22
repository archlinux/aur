# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-robin-stocks
_pkgname=robin_stocks
pkgver=2.1.0
pkgrel=1
pkgdesc="A Python wrapper around the Robinhood API"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-requests python-pyotp python-dotenv python-cryptography)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('3d6b1d97ecf3191897d09c9dc430b57c6183a38d4c66a64f9c62a8f015bb0ae9')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
