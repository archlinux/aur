# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-py-find-1st
_pkgname=py_find_1st
pkgver=1.1.7
pkgrel=1
pkgdesc="Numpy extension module for efficient search of first array index that compares true"
arch=('any')
url="http://github.com/roebel/py_find_1st"
license=(GPL)
makedepends=(python-build python-installer python-setuptools)
depends=(python python-numpy)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('ab268715aff22e1f93242a548e5a514a6f84b962b0dea68b02d9f472d88bf9d0')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
