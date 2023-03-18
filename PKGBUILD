# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-ascii_magic
_pkgname=${pkgname:7}
pkgver=2.3.0
pkgrel=1
pkgdesc="Converts pictures into ASCII art"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('3ed41a1cb167deed5ccfc628b669f35a3a03f67bdd72dcc18be5ffd8a2643d85')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
