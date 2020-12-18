# Maintainer: pfm <vorticity at mail dot ru>
pkgname=python-eliot
_pkgname=eliot
pkgver=1.13.0
pkgrel=1
pkgdesc="Logging that tells you why it happened"
arch=(any)
url="https://eliot.readthedocs.io"
license=('Apache')
depends=("python>3.5.2")
makedepends=("python-setuptools")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/itamarst/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('b07a362fb9643c6e3ac7edd3a121f425')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package(){
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
