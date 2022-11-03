# Maintainer: Michał Wojdyła <micwoj9292 at gmail dot com>

pkgname=python2-pytz
pkgver=2022.6
pkgrel=1
arch=('any')
url="https://pypi.python.org/pypi/pytz"
license=("MIT")
pkgdesc="Cross platform time zone library for Python2"
depends=('python2')
source=("https://pypi.io/packages/source/p/pytz/pytz-${pkgver}.tar.gz")
sha512sums=('ea0343453d011e252fba64502984e2a43ea7c7437a211025ca68a4a45178c8aaef4c2b65261434289b21166a99a1941ec9e2d9d26bb3d22a76cbaa421250131d')
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
