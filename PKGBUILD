# Maintainer: PaddiM8 <bakk@tuta.io>
pkgname=asahi-battery-threshold-git
pkgver=0.0.1
pkgrel=1
pkgdesc="A small daemon that allows setting a charging threshold for laptops running Asahi Linux."
arch=('aarch64')
url="https://github.com/PaddiM8/asahi-battery-threshold"
license=('MIT')
makedepends=('cargo')
source=('git+https://github.com/PaddiM8/asahi-battery-threshold')

build() {
  cd $pkgname
  cargo build --release
}

package() {
  cd $pkgname
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm664 "extra/$pkgname.service" "$pkgdir/etc/systemd/system/$pkgname.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
b2sums=('SKIP')
