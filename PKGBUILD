# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

_pkgname=yattag
pkgname=python-${_pkgname}
pkgver=1.13.2
pkgrel=2
pkgdesc="Yattag is a Python library for generating HTML or XML in a pythonic way"
url="http://yattag.org"
depends=('python')
makedepends=('python-setuptools')
optdepends=()
license=('LGPL')
arch=('any')
source=(https://pypi.python.org/packages/source/y/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('41c1182f81e69bc53d8763c5bb9d27f54ae05ce581ee4e41c7931cc2f2479262')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package_python-yattag() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python3*/site-packages/tests/
}
