# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-beartype
_pkgname=${pkgname:7}
pkgver=0.14.0
pkgrel=2
pkgdesc="Unbearably fast runtime type checking in pure Python."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('546e6e8dcdda1d6d9f906ea4eb1518aa01c9c5f5a440e495917b2daf53cbd598')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
