# Maintainer: Sashetophizika

pkgname=hyprscratch
pkgver=0.5.2
pkgrel=1
pkgdesc="Improved scratchpad functiontality for Hyprland"
url="https://github.com/sashetophizika/hyprscratch"
makedepends=('cargo')
depends=('hyprland')
arch=('x86_64')
license=('MIT')
source=("https://github.com/sashetophizika/hyprscratch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('64e33139a1ad3171dbbf75ad9eee66144bff66a558a3a32edef78f16750419ca')

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
