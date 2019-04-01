# Maintainer: Ainola

pkgname=python-oath
pkgver=1.4.1
pkgrel=8
pkgdesc="Python implementation of HOTP, TOTP and OCRA algorithms from OATH"
arch=('any')
url="https://github.com/bdauvergne/python-oath"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://pypi.io/packages/source/o/oath/oath-$pkgver.tar.gz")
sha256sums=('60f59ead7dfe56c49e98ace4d4abab1b62fe65b657d3bfeebb60b322c0be30db')

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
