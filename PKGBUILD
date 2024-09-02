# Maintainer: Álvaro Jesús Baena Rosino <alvarojsino8@gmail.com>
pkgname='mecano'
pkgver='0.2.1'
pkgrel='1'
pkgdesc='Minimalistic typing train'
arch=('x86_64')
makedepends=('cargo')
source=(
   "https://github.com/alvarojsino813/mecano/archive/refs/tags/v$pkgver.tar.gz"
   )
license=('unlicense')

build() {
   cd "$srcdir/$pkgname-$pkgver/"
   cargo build --release --target-dir=target
   cd ../..
}

package() { 
   install -d "$pkgdir/usr/share/$pkgname/dictionaries"
   cp -r "$srcdir/$pkgname-$pkgver/dictionaries/" "$pkgdir/usr/share/$pkgname/"
   install -Dm755 "$srcdir/$pkgname-$pkgver/config.toml" "$pkgdir/usr/share/$pkgname/config.toml"
   install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/mecano" "$pkgdir/usr/bin/$pkgname"
}
sha256sums=('e3d0a0c16f27f719b6f2e36e287f2b5acc0e7f1b44df049f913466478f334cf6')
sha256sums=('6ffd897f64dbffaab917d82bb2a80f543f0de94e3a17563b6c69b94d8266a0e3')
