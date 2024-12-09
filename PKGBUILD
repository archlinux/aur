# Maintainer: cqzw555 < cqzw555@163.com >
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-libclang
_pkgname=${pkgname:7}
pkgver=18.1.1
pkgrel=2
pkgdesc="Clang Python Bindings"
arch=($CARCH)
url="https://pypi.org/project/${_pkgname}"
license=('Apache-2.0')
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/l/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('a1214966d08d73d971287fc3ead8dfaf82eb07fb197680d8b3859dbbbbf78250')
build() {
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}
package() {
    cd $_pkgname-$pkgver

    python -m installer --destdir="$pkgdir" dist/*.whl
}
