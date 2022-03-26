# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-types-python-dateutil
_pkgname=${pkgname:7}
pkgver=2.8.10
pkgrel=1
pkgdesc="Typing stubs for python-dateutil"
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(Apache)
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('6bcf3aae7242e5793bafd7b2bcfb4e255eb7b2b3144acd0df0e182dce58ccad3')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
