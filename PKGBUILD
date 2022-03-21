# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-google-pasta
_pkgname=${pkgname:7}
pkgver=0.2.0
pkgrel=1
pkgdesc="AST-based Python refactoring library"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python python-six)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('c9f2c8dfc8f96d0d5808299920721be30c9eec37f2389f28904f454565c8a16e')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
