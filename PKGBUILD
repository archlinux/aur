# Maintainer: Michał Wojdyła <micwoj9292 at gmail dot com>

pkgname=python2-pytz
pkgver=2022.7
pkgrel=1
arch=('any')
url="https://pypi.python.org/pypi/pytz"
license=("MIT")
pkgdesc="Cross platform time zone library for Python2"
depends=('python2')
source=("https://pypi.io/packages/source/p/pytz/pytz-${pkgver}.tar.gz")
sha512sums=('48bad8a88e124c0935bf307713659228100c5c38230b3ee7f0aa92e46a1a305c4cebef388208dc7090ba59f51c4816f78789a091d69541615e885a9ad61c475b')
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
