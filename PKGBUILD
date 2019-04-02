# Maintainer: Ainola

pkgname=python-oath
pkgver=1.4.2
pkgrel=1
pkgdesc="Python implementation of HOTP, TOTP and OCRA algorithms from OATH"
arch=('any')
url="https://github.com/bdauvergne/python-oath"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://pypi.io/packages/source/o/oath/oath-$pkgver.tar.gz")
sha256sums=('4ab990e530ebbc607f67d7df34c5d26147a7d431bae54dcfb44b3704b04dbd0f')

build() {
    cd "oath-$pkgver"
    python setup.py build
}

check() {
    cd "oath-$pkgver"
    python setup.py test
}

package_python-oath() {
    cd "oath-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 doc/* -t "$pkgdir/usr/share/doc/$pkgname/"
}
