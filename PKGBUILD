# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cavif
pkgver=1.3.5
pkgrel=1
pkgdesc="AVIF image creator in pure Rust"
arch=('i686' 'x86_64')
url="https://lib.rs/crates/cavif"
license=('BSD')
depends=('gcc-libs')
makedepends=('nasm' 'rust')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/kornelski/cavif-rs/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a3dc1ad3126332749ea247079c68338468c8902d6c6f102880acc1e7257b1bf2')


check() {
  cd "cavif-rs-$pkgver"

  #cargo test \
  #  --release
}

package() {
  cd "cavif-rs-$pkgver"

  cargo install \
    --no-track \
    --root "$pkgdir/usr" \
    --path "$srcdir/cavif-rs-$pkgver"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/cavif"
}
