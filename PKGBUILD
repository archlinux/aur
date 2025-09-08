# Maintainer: Bishnu Babu Sah <your.email@example.com>

pkgname=dns-changer
pkgver=0.1.0
pkgrel=2
pkgdesc="A Rust-based tool for changing DNS interactively"
arch=('x86_64')
url="https://github.com/bishnu7babu/dns_changer"
license=('MIT')
depends=('glibc')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b89665210de787d356c7fde607108936be7d332c4efe1b3a5c4137510d408806')

build() {
  cd "$srcdir/dns_changer-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/dns_changer-$pkgver"
  install -Dm755 "target/release/dns_changer" "$pkgdir/usr/bin/dns-changer"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}