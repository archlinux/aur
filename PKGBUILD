# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=rusty-krab-manager
pkgver=1.2.1
pkgrel=1
pkgdesc="Time management TUI"
arch=('x86_64')
url="https://github.com/aryakaul/rusty-krab-manager"
license=('custom:ETHICAL')
depends=('alsa-lib' 'gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('4e177607555edcb5f8afcba4f8c920c303b06cfae7d0b19a1d11535189a78aec80836f0509194f012321612790e8afc8807138d72894c44a0b041663dc605380')

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
