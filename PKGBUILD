# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=jfmt
pkgver=1.2.0
pkgrel=1
pkgdesc="Fast JSON auto-formatter"
arch=("x86_64")
url="https://github.com/scruffystuffs/jfmt.rs"
license=("MIT")
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('5565eb158b9618944470e6e708c464e46e3dabe2b8bfd1bd2fff2b0618ca437e')

build() {
  cd "$pkgname.rs-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname.rs-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.rs-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
