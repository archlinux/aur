# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pyupgrade
_pkgname=${pkgname:7}
pkgver=2.31.1
pkgrel=1
pkgdesc="A tool to automatically upgrade syntax for newer versions."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('22e0ad6dd39c4381805cb059f1e691b6315c62c0ebcec98a5f29d22cd186a72a')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
