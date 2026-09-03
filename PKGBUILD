# Maintainer: rnestler

pkgname=reboot-arch-btw
pkgver=1.1.0
pkgrel=1
pkgdesc='Check if you need to reboot due to an updated kernel'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/rnestler/reboot-arch-btw"
license=('GPL-3.0-only')
makedepends=('rust' 'cargo')
depends=('dbus' 'pacman>6')
replaces=('kernel-updated')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('911991efee818e78a203e7956d600c85e3c72a06635abfe520137937366b4649')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
}
