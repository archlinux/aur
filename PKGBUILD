# Maintainer: Árni Dagur <arnidg@protonmail.ch>
pkgname=futhark
pkgver=0.9.1
pkgrel=1
pkgdesc="A data-parallel functional programming language."
arch=('x86_64')
url='https://futhark-lang.org/'
license=('ISC')
source=("https://github.com/diku-dk/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-linux-x86_64.tar.xz")
sha512sums=('b07e12390880b899a6ba13ad72946686475f0b0008ef0e5c50c50f13798940e8b68a764189baad78b6a554894e6c2eba9dd6657d7c729b3e6b7ea7f50c0d3ed3')

package() {
    cd "$srcdir/$pkgname-$pkgver-linux-x86_64"
    make PREFIX="$pkgdir/usr" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}