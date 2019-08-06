# Maintainer: pfm <vorticity at mail dot ru>
pkgname=python-eliot
_pkgname=eliot
pkgver=1.10.0
pkgrel=1
pkgdesc="Logging that tells you why it happened"
arch=(any)
url="https://eliot.readthedocs.io"
license=('Apache')
depends=("python>3.5.2")
makedepends=("python-setuptools")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/itamarst/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('a2ac64be535f357e1be7572c1b3fbf57')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package(){
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
