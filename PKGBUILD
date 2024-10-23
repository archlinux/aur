# Maintainer: Coral Pink <coral.pink@disr.it>
pkgname=unshell
pkgver=0.11.0
pkgrel=1
pkgdesc='A utility for splitting input into shell-like tokens'
url='https://codeberg.org/coralpink/unshell'
arch=('any')
license=('custom:MIT+NIGGER')
source=(
    "$pkgname-$pkgver.tar.gz::https://codeberg.org/coralpink/unshell/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
    "$pkgname-$pkgver.tar.gz.sig::https://codeberg.org/coralpink/unshell/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.asc"
)
b2sums=(
    '7b16e3f744d8dd760417390ca2fd3fe2b63554f58698c104bd2d7610918ebe72a5312bb34dff60e242caf97abd960fab2853ef484480af6b1554b7198a6dc193'
    '15b84f733522df80feb47097eca00923bec1f46d3db891f9cc5291251bf7f111f637aa4c4a864f5d54cc539ab18ace77c432197872b0e51099781cab7b42114d'
)
validpgpkeys=('88CF318EE94748D582940E86CC5693B9689DB487')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

