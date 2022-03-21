# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-beartype
_pkgname=${pkgname:7}
pkgver=0.10.4
pkgrel=1
pkgdesc="Unbearably fast runtime type checking in pure Python."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('24ec69f6a7f4e6e97af403d08de270def3248518060327095d23b1c4df64bf2a')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
