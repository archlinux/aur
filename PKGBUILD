# Maintainer: OminduD <omindudulneth@outlook.com>
pkgname=arch-sandbox
pkgver=v1.0.0
pkgrel=1
pkgdesc="CLI tool to create isolated Arch Linux sandboxes using OverlayFS and systemd-nspawn"
arch=('x86_64')
url="https://github.com/OminduD/arch-sandbox"
license=('MIT')
depends=('systemd' 'zstd')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OminduD/arch-sandbox/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('44758caea6a2de94518e94a9b587814b45da36488247c93ee882f81cd09a0bab') # Replace with actual SHA256

build() {
  cd "$pkgname-$pkgver"
  go build -o "$pkgname"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}