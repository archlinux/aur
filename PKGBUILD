# Maintainer: Ainola

pkgname=python-oath
pkgver=1.4.0
pkgrel=3
pkgdesc="Python implementation of HOTP, TOTP and OCRA algorithms from OATH."
arch=('any')
url="https://github.com/bdauvergne/python-oath"
license=('BSD')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/bdauvergne/python-oath/archive/v$pkgver.tar.gz")
sha256sums=('3e485d0fc4a6c077cb75841cba6512c1ab1b11d766969a24b199586e04e7c58f')

build() {
    cd "python-oath-$pkgver"
    python setup.py build
}

package() {
    cd "python-oath-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
