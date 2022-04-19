# Maintainer:   vertion <vertion@protonmail.com>
# Contributor:  James Lovejoy

pkgname=python-vertcoinhash-git
pkgver=1.0.1
pkgrel=1

pkgdesc='Python bindings for proof of work used by Vertcoin '
arch=('any')
url='https://github.com/vertcoin-project/vertcoinhash-python'
license=('MIT')

depends=('python-setuptools')
provides=('vertcoinhash-python')
conflicts=('vertcoinhash-python')

source=('git+https://github.com/vertcoin-project/vertcoinhash-python')
sha256sums=('SKIP')

build() {
    cd "$srcdir/vertcoinhash-python/"
    git checkout v1.0.1
}

package() {
    cd "$srcdir/vertcoinhash-python/"
    python setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr
}
