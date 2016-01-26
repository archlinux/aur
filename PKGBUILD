# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=('python-yattag' 'python2-yattag')
_pkgname=yattag
pkgver=1.5.2
pkgrel=1
pkgdesc="Yattag is a Python library for generating HTML or XML in a pythonic way"
url="http://yattag.org"
depends=('python' 'python-setuptools' 'python2-setuptools')
optdepends=()
license=('LGPL')
arch=('any')
source=("https://pypi.python.org/packages/source/y/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e117a40dfa246639fbe0f3a8d344505e38d71c4ffe096985e9b581a1c2bcf687')

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
