# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-ascii_magic
_pkgname=${pkgname:7}
pkgver=1.6
pkgrel=1
pkgdesc="Converts pictures into ASCII art"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('7da5518f7368e73f11e2151a0c060804aa149e267b369b7ee7653fbd7b046a51')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
