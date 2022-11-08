# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-types-python-dateutil
_pkgname=${pkgname:7}
pkgver=2.8.19.3
pkgrel=1
pkgdesc="Typing stubs for python-dateutil"
arch=('any')
url="https://github.com/python/typeshed"
license=(Apache)
makedepends=(python-build python-installer python-setuptools python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('a313284df5ed3fd078303262edc0efde28998cd08e5061ef1ccc0bb5fef4d2da')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}

