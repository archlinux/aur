# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cavif
pkgver=1.3.4
pkgrel=1
pkgdesc="AVIF image creator in pure Rust"
arch=('i686' 'x86_64')
url="https://lib.rs/crates/cavif"
license=('BSD')
depends=('gcc-libs')
makedepends=('nasm' 'rust')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/kornelski/cavif-rs/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8b40cd91d7304c72d9dd9805fb9e9438f00e65d27f0dfa773d6e6abd71f6d895')


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
