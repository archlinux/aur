# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-py-find-1st
_pkgname=py_find_1st
pkgver=1.1.5
pkgrel=2
pkgdesc="Numpy extension module for efficient search of first array index that compares true"
arch=('any')
url="http://github.com/roebel/py_find_1st"
license=(GPL)
makedepends=(python-build python-installer python-wheel)
depends=(python python-numpy python-oldest-supported-numpy)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('f99207bc83df361c4cd9c6c2aaf504907ffce7fdd33ae3d3cbf39c68a4f1c1a9')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
