# Maintainer: rnestler

pkgname=reboot-arch-btw
pkgver=0.5.5
pkgrel=1
pkgdesc='Check if you need to reboot due to an updated kernel'
arch=('i686' 'x86_64')
url="https://github.com/rnestler/reboot-arch-btw"
license=('GPL3')
makedepends=('rust' 'cargo')
depends=('dbus' 'pacman>6')
replaces=('kernel-updated')
source=("https://github.com/rnestler/reboot-arch-btw/archive/v${pkgver}.tar.gz")
sha256sums=('2ec5a0549c0c02aa0b412469726ace48d41596fec40b31a28fbf05ede2fb5dca')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  cp -p target/release/${pkgname} "${pkgdir}/usr/bin"
}
