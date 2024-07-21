# Maintainer: Sashetophizika

pkgname=hyprscratch
pkgver=0.4.2
pkgrel=1
pkgdesc="Scratchpad functiontality for Hyprland"
url="https://github.com/sashetophizika/hyprscratch"
makedepends=('cargo')
depends=('hyprland')
arch=('x86_64')
license=('MIT')
source=("https://github.com/sashetophizika/hyprscratch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6350430bbd71dc9e5051b1682c8470c2e9028d33f2d5592348cccb59fb3a536a')

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
