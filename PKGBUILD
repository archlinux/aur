# Maintainer: Sasheto-phizika

pkgname=hyprscratch
pkgver=0.4.1
pkgrel=1
pkgdesc="Scratchpad functiontality for Hyprland"
url="https://github.com/sashetophizika/hyprscratch"
makedepends=('cargo')
depends=('hyprland')
arch=('x86_64')
license=('MIT')
source=("https://github.com/sasheto-phizika/hyprscratch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e4ffa47f912e5cc02300bd8e9d10a4a2070a9d212672f5446189e1a8333ba6b5')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
