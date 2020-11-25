# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=rusty-krab-manager
pkgver=1.1.4
pkgrel=1
pkgdesc="Time management TUI"
arch=('x86_64')
url="https://github.com/aryakaul/rusty-krab-manager"
license=('custom:ETHICAL')
makedepends=('rust' 'alsa-lib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c7af5435075ce9f848908a952eb22bb5aeb5b3c011d90d1af2cd55d9f4f03f11d32e601f0c96e5cdd2dac3ef0a43682f04c9849d62a2c2a1734a4090e85ab925')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
