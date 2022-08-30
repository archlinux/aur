# Maintainer: rnestler

pkgname=reboot-arch-btw
pkgver=0.4.0
pkgrel=1
pkgdesc='Check if you need to reboot due to an updated kernel'
arch=('i686' 'x86_64')
url="https://github.com/rnestler/reboot-arch-btw"
license=('GPL3')
makedepends=('rust' 'cargo')
depends=('dbus' 'xorg-xdpyinfo')
replaces=('kernel-updated')
source=("https://github.com/rnestler/reboot-arch-btw/archive/v${pkgver}.tar.gz")
sha256sums=('cd4ce993c6b7d4521c0efd735413dcd7e94d67530f58a7e6f9c56a1e530d4788')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  cp -p target/release/${pkgname} "${pkgdir}/usr/bin"
}
