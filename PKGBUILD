# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

_pkgname=yattag
pkgname=python-${_pkgname}
pkgver=1.15.0
pkgrel=1
pkgdesc='Python library for generating HTML or XML in a pythonic way.'
url='http://yattag.org'
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
license=('LGPL')
arch=('any')
source=("https://pypi.python.org/packages/source/y/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6a9ff3fd330a60287804ea7370a84166b624ebf4b7ad9ed788b7c57779b65263')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package_python-yattag() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -rf ${pkgdir}/usr/lib/python3*/site-packages/tests/
}
