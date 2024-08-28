# Maintainer: Timo Denissen <timo+aur(at)familiedenissen.de>
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pymeeus
_pkgname=PyMeeus
pkgver=0.5.12
pkgrel=1
pkgdesc="Python implementation of Jean Meeus astronomical routines"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('LGPL')
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('548f7186bd8b96cbc069cf649a8e8e377dce49ac74486709849fe63a99cad684')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
