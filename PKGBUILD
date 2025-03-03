# Maintainer: redponike <proton (dot) me>
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgname=python-squarify
_pkgname=${pkgname#python-}
pkgver=0.4.4
pkgrel=1
pkgdesc="Pure Python implementation of the squarify treemap layout algorithm"
arch=('any')
url="https://github.com/laserson/squarify"
license=('Apache-2.0')
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('b8a110c8dc5f1cd1402ca12d79764a081e90bfc445346cfa166df929753ecb46')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
