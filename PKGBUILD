# Maintainer: Brenton Horne <please contact me in the AUR comments>
pkgname=jsx-lexer
pkgver=0.0.8
pkgrel=1
pkgdesc="A JSX lexer for Pygments"
arch=(any)
url="https://github.com/fcurella/jsx-lexer"
license=(custom)
makedepends=(python-setuptools nodejs)
depends=(python3)
source=(https://github.com/fcurella/jsx-lexer/archive/v${pkgver}.tar.gz)
sha256sums=('3220744d4c98084a49d009332df573acb8758982c837d88b932df80c2b1201ee')

build() {
    cd $srcdir/jsx-lexer-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/jsx-lexer-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
