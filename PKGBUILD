# Maintainer: Michał Wojdyła <micwoj9292 at gmail dot com>

pkgname=python2-pytz
pkgver=2022.1
pkgrel=1
arch=('any')
url="https://pypi.python.org/pypi/pytz"
license=("MIT")
pkgdesc="Cross platform time zone library for Python2"
depends=('python2')
source=("https://pypi.io/packages/source/p/pytz/pytz-${pkgver}.tar.gz")
sha512sums=('7737aa28626743026b7de932b27bf44d7b209f495d9dd7f90c6448ec271e007f23004fcd04982e2ca6d0a4075206e1dae7b8836319c299b5559c514366d518a6')
validpgpkeys=('C7ECC365AB6F255E1EB9BA1701FA998FBAC6374A')

build(){
    cd pytz-$pkgver
    python2 setup.py build
}

check(){
    cd pytz-$pkgver/pytz/tests
    python2 test_tzinfo.py
}

package(){
    cd pytz-$pkgver
    python2 setup.py install --root="$pkgdir"/
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
