# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-beartype
_pkgname=${pkgname:7}
pkgver=0.13.1
pkgrel=1
pkgdesc="Unbearably fast runtime type checking in pure Python."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('2903947a8a1eb6030264e30108aa72cb1a805cfc9050c0f4014c4aed3a17a00b')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
