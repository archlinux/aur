# Maintainer:   vertion <vertion@protonmail.com>
# Contributor:  James Lovejoy

pkgname=python-vertcoinhash-git
pkgver=1.0.1
pkgrel=2

pkgdesc='Python bindings for proof of work used by Vertcoin '
arch=('any')
url='https://github.com/vertcoin-project/vertcoinhash-python'
license=('MIT')

depends=('python-setuptools')
provides=('vertcoinhash-python')
conflicts=('vertcoinhash-python')
source=("vertcoinhash-python-$pkgver.tar.gz::https://github.com/vertcoin-project/vertcoinhash-python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c7de0d338ff8fe26eb222bfe2f806a45d7e642ab8fcf565d7ccc8ef7c66af564')

build() {
    cd "$srcdir/vertcoinhash-python-$pkgver/"
}

package() {
    cd "$srcdir/vertcoinhash-python-$pkgver/"
    python setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr
}
