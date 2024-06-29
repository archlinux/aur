# Maintainer: Álvaro Jesús Baena Rosino <alvarojsino8 at gmail dot com>
pkgname='mecano'
pkgver='0.1.1'
pkgrel='2'
pkgdesc='Minimalistic typing train'
arch=('x86_64')
makedepends=('cargo')
source=(
   'https://github.com/alvarojsino813/mecano/archive/refs/tags/0.1.1.tar.gz'
   )
license=('unlicense')

build() {
   cd "$srcdir/$pkgname-$pkgver/"
   cargo build --release --target-dir=target
   cd ../..
}

package() { 
   install -d "$pkgdir/usr/share/$pkgname/dictionaries"
   install -Dm755 "$srcdir/$pkgname-$pkgver/config.toml" "$pkgdir/usr/share/$pkgname/mecano.toml"
   cp -r "$srcdir/$pkgname-$pkgver/dictionaries/" "$pkgdir/usr/share/$pkgname/"
   install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/mecano" "$pkgdir/usr/bin/$pkgname"
}
sha256sums=('5688cb1c5d370bdb61b95ae7f362ca50775aa3df3006334564865538a86c73ad')
