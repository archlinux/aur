# Maintainer: Michal Wojdyla <micwoj9292 at gmail dot com>

pkgname=python2-pytz
pkgver=2021.3
pkgrel=1
arch=('any')
url="https://pypi.python.org/pypi/pytz"
license=("MIT")
pkgdesc="Cross platform time zone library for Python2"
depends=('python2')
source=("https://pypi.io/packages/source/p/pytz/pytz-${pkgver}.tar.gz")
sha512sums=('c45099f319592976b7715d9973496a2c7438a1b958ef8b90a1ad1fb97e7035624fe6191796727d4b7edf3236271bea4d864e25d1d92431e8cf767ac798448882')
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
