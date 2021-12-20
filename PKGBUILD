# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

_pkgname=yattag
pkgname=python-${_pkgname}
pkgver=1.14.0
pkgrel=1
pkgdesc="Yattag is a Python library for generating HTML or XML in a pythonic way"
url="http://yattag.org"
depends=('python')
makedepends=('python-setuptools')
optdepends=()
license=('LGPL')
arch=('any')
source=(https://pypi.python.org/packages/source/y/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('5731a31cb7452c0c6930dd1a284e0170b39eee959851a2aceb8d6af4134a5fa8')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package_python-yattag() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python3*/site-packages/tests/
}
