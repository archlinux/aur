# Maintainer: Álvaro Jesús Baena Rosino <alvarojsino8@gmail.com>
pkgname='mecano'
pkgver='0.2.1'
pkgrel='2'
pkgdesc='Minimalist typing train'
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
   install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/mecano" "$pkgdir/usr/bin/$pkgname"
}
sha256sums=('6703fbc7b52acac64633f1b9aa2d52f748039c60177877f4e52af56289f4de62')
