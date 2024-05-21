# Maintainer: rnestler

pkgname=reboot-arch-btw
pkgver=0.8.0
pkgrel=1
pkgdesc='Check if you need to reboot due to an updated kernel'
arch=('i686' 'x86_64')
url="https://github.com/rnestler/reboot-arch-btw"
license=('GPL3')
makedepends=('rust' 'cargo')
depends=('dbus' 'pacman>6')
replaces=('kernel-updated')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('883ac4a76793f1d33148b411a9011f19ea6abe2e54de86b43a7c6545642d85f8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  cp -p target/release/${pkgname} "${pkgdir}/usr/bin"
}
