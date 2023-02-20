# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-ascii_magic
_pkgname=${pkgname:7}
pkgver=2.1.1
pkgrel=1
pkgdesc="Converts pictures into ASCII art"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('61f19afb79eea80028ebd4f27713bab8a34c72a64090e122fcf30ff05adab1fc')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
