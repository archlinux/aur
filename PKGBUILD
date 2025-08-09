# Maintainer: OminduD <omindudulneth@outlook.com>
pkgname=arch-sandbox
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI tool to create isolated Arch Linux sandboxes using OverlayFS and systemd-nspawn"
arch=('x86_64')
url="https://github.com/OminduD/arch-sandbox"
license=('MIT')
depends=('systemd' 'zstd')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OminduD/arch-sandbox/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('
9073feb2828eed0e9973868e16e8c0c37e976b47282baed86a46b78c50de3ae4  v1.0.0.tar.gz')  # Replace with the checksum you got

build() {
  cd "$pkgname-$pkgver"
  go build -o "$pkgname"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}