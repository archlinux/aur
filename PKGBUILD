# Maintainer: Sashetophizika

pkgname=hyprscratch
pkgver=0.6.0
pkgrel=1
pkgdesc="Improved scratchpad functiontality for Hyprland"
url="https://github.com/sashetophizika/hyprscratch"
makedepends=('cargo')
depends=('hyprland')
arch=('x86_64')
license=('MIT')
source=("https://github.com/sashetophizika/hyprscratch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b991783208e660f66b4876777c8591605e2b638ed28b4a0ff77f7e47b7c4f217')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
