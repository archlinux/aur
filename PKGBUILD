# Maintainer: rnestler

pkgname=reboot-arch-btw
pkgver=1.0.0
pkgrel=1
pkgdesc='Check if you need to reboot due to an updated kernel'
arch=('i686' 'x86_64')
url="https://github.com/rnestler/reboot-arch-btw"
license=('GPL-3.0-only')
makedepends=('rust' 'cargo')
depends=('dbus' 'pacman>6')
replaces=('kernel-updated')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('ab6a6c2e0f75a8f2df878f5d5105de13149c18fec18d56d53c1c53ab006f8e64')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
}
