# Maintainer: rnestler

pkgname=reboot-arch-btw
pkgver=0.9.0
pkgrel=1
pkgdesc='Check if you need to reboot due to an updated kernel'
arch=('i686' 'x86_64')
url="https://github.com/rnestler/reboot-arch-btw"
license=('GPL-3.0-only')
makedepends=('rust' 'cargo')
depends=('dbus' 'pacman>6')
replaces=('kernel-updated')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('77ffd007023f93d82be50ab310b92362465215d03a044a8eb4a8765c2e6f058c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
}
