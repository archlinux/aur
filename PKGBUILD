# Maintainer: Sasheto-phizika

pkgname=hyprscratch
pkgver=0.4.0
pkgrel=1
pkgdesc="Scratchpad funciontality for Hyprland"
url="https://github.com/sasheto-phizika/hyprscratch"
makedepends=('cargo')
depends=('hyprland')
arch=('x86_64')
license=('MIT')
source=("https://github.com/sasheto-phizika/hyprscratch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f4197425decfc60bd1fb3f0a5d31bf4bf0e0b868884117b26be483ac1b1d20bb')

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
