# Maintainer: Álvaro Jesús Baena Rosino <alvarojsino8@gmail.com>
pkgname='mecano'
pkgver='0.2.0'
pkgrel='2'
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

sha256sums=('a509c19adb35b49a6abd7868d0bcd21d489b0de3687be3a984b564c2ca8b927e')
sha256sums=('a509c19adb35b49a6abd7868d0bcd21d489b0de3687be3a984b564c2ca8b927e')
