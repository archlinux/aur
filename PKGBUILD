# Maintainer: rnestler

pkgname=reboot-arch-btw
pkgver=0.7.0
pkgrel=1
pkgdesc='Check if you need to reboot due to an updated kernel'
arch=('i686' 'x86_64')
url="https://github.com/rnestler/reboot-arch-btw"
license=('GPL3')
makedepends=('rust' 'cargo')
depends=('dbus' 'pacman>6')
replaces=('kernel-updated')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('3686dc6de90d30e6cefddec9d0c173d1bb32c2928af13d91350ae101d00267b4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  cp -p target/release/${pkgname} "${pkgdir}/usr/bin"
}
