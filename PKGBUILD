# Maintainer: Ainola

pkgname=python2-oath
pkgver=1.4.0
pkgrel=1
pkgdesc="Python implementation of HOTP, TOTP and OCRA algorithms from OATH."
arch=('any')
url="https://github.com/bdauvergne/python-oath"
license=('BSD')
makedepends=('python2-setuptools')
depends=('python2')
source=("https://github.com/bdauvergne/python-oath/archive/v$pkgver.tar.gz")
sha256sums=('3e485d0fc4a6c077cb75841cba6512c1ab1b11d766969a24b199586e04e7c58f')

build() {
    cd "$srcdir/python-oath-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/python-oath-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

