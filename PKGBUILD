# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pymeeus
_pkgname=PyMeeus
pkgver=0.5.11
pkgrel=2
pkgdesc="Python implementation of Jean Meeus astronomical routines"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('LGPL')
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('bb9d670818d8b0594317b48a7dadea02a0594e5344263bf2054e1a011c8fed55')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
