# Maintainer: Bishnu Babu Sah <your.email@example.com>

pkgname=dns-changer
pkgver=0.1.0
pkgrel=1
pkgdesc="A Rust-based tool for changing DNS interactively"
arch=('x86_64')
url="https://github.com/bishnu7babu/dns_changer.git"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # Optional: include docs
  # install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
