# Maintainer: Michael Clayfield <me asdf michaelclayfield asdf com asdf>

pkgname=bluez-monitor
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple Rust BlueZ D-Bus monitor that outputs events to stdout in JSON format."
url="https://github.com/FieldofClay/bluez-monitor"
makedepends=('cargo')
depends=('bluez')
arch=('x86_64')
license=('MIT')
source=("https://github.com/FieldofClay/bluez-monitor/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6407196ca43b3f1d6753f05e63a08e3d22666f571f8b2134ee4b1ea74463ea8e')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
