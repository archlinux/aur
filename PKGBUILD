# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-types-python-dateutil
_pkgname=${pkgname:7}
pkgver=2.8.17
pkgrel=1
pkgdesc="Typing stubs for python-dateutil"
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(Apache)
makedepends=(python-build python-installer python-setuptools python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('6c54265a221681dd87f61df6743bd5eab060cf1b4086ff65c1a8fd763ed6370e')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}

