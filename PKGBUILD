# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

_pkgname=yattag
pkgname=(python-${_pkgname} python2-${_pkgname})
pkgver=1.11.1
pkgrel=1
pkgdesc="Yattag is a Python library for generating HTML or XML in a pythonic way"
url="http://yattag.org"
depends=('python' 'python-setuptools' 'python2-setuptools')
optdepends=()
license=('LGPL')
arch=('any')
source=(https://pypi.python.org/packages/source/y/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('94210945c868f696a31812a510c01724d61c9a4d279eb4adf340c0d2a4c0bfd7')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package_python-yattag() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python3*/site-packages/tests/
}

package_python2-yattag() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python2*/site-packages/tests/
}
