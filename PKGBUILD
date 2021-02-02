# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: kdheepak <me@kdheepak.com>
# https://github.com/orhun/pkgbuilds

pkgname=taskwarrior-tui
pkgver=0.9.7
pkgrel=1
pkgdesc="A Terminal User Interface for Taskwarrior"
arch=('x86_64')
url="https://github.com/kdheepak/taskwarrior-tui"
license=('MIT')
depends=('task')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('cac3dc23b18257b4dfce5a6d4d868eaea3e02a8714764cc9b57087134877b27eb68663a0b4b2ab9d6fe2703dc33d714fa6f5a17e374476ab8642e8a80787fcf0')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
