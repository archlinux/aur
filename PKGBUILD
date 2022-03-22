# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-squarify
_pkgname=${pkgname:7}
pkgver=0.4.3
pkgrel=1
pkgdesc="Pure Python implementation of the squarify treemap layout algorithm"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('54091f6ad175f7f201f8934574e647ce1b50dedc478c5fd968688eb7d7469f95')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
