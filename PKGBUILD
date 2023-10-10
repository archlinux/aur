# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-beartype
_pkgname=${pkgname:7}
pkgver=0.16.2
pkgrel=2
pkgdesc="Unbearably fast runtime type checking in pure Python."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('47ec1c8c3be3f999f4f9f829e8913f65926aa7e85b180d9ffd305dc78d3e7d7b')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
