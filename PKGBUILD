# Maintainer: rnestler

pkgname=reboot-arch-btw
pkgver=0.5.3
pkgrel=1
pkgdesc='Check if you need to reboot due to an updated kernel'
arch=('i686' 'x86_64')
url="https://github.com/rnestler/reboot-arch-btw"
license=('GPL3')
makedepends=('rust' 'cargo')
depends=('dbus' 'xorg-xdpyinfo' 'pacman>6')
replaces=('kernel-updated')
source=("https://github.com/rnestler/reboot-arch-btw/archive/v${pkgver}.tar.gz")
sha256sums=('788e78da731e53c1fc0d409709d49d447000d69b4a899952bd97bd10535b0edd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  cp -p target/release/${pkgname} "${pkgdir}/usr/bin"
}
sha256sums=('79210bce3161503eb36025a4777aba6a3e1d3cb0720ce3fcc2797c6fa8685872')
