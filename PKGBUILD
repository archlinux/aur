# Maintainer: Coral Pink <coral.pink@disr.it>
pkgname=unshell
pkgver=0.10.1
pkgrel=1
pkgdesc='A utility for splitting input into shell-like tokens'
url='https://codeberg.org/coralpink/unshell'
arch=('any')
license=('custom:MIT+NIGGER')
source=(
    "$pkgname-$pkgver.tar.gz::https://codeberg.org/coralpink/unshell/archive/$pkgver.tar.gz"
    "$pkgname-$pkgver.tar.gz.sig::https://codeberg.org/coralpink/unshell/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.sig"
)
sha256sums=(
    '1e6ea1a8239bd3e672f0f59912b26205b5e00c38e357dd55adaedd49f85173b3'
    '22e244dc027190753955abc297c3e51f3169e226df1aa8f9ede9fe7c91153270'
)
validpgpkeys=('88CF318EE94748D582940E86CC5693B9689DB487')

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr PACKAGE_NAME="$pkgname" install
}

