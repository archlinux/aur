# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=i3-workspace-brightness
pkgver=1.0.2
pkgrel=1
pkgdesc="Utility to auto-adjust the brightness of i3wm workspaces"
arch=('x86_64')
url="https://github.com/orhun/i3-workspace-brightness"
license=('GPL3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}