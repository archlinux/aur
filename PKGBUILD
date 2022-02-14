# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=jfmt
pkgver=1.2.1
pkgrel=1
pkgdesc="Fast JSON auto-formatter"
arch=("x86_64")
url="https://github.com/scruffystuffs/jfmt.rs"
license=("MIT")
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3f16ced1cc35f13e4e8832f12e765c50df0948260a522bd15df1da2fcc3b85a8')

build() {
  cd "$pkgname.rs-$pkgver"
  CARGO_TARGET_DIR=target cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname.rs-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.rs-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
