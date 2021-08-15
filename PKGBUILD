# Maintainer: rnestler

pkgname=reboot-arch-btw
pkgver=0.3.1
pkgrel=1
pkgdesc='Check if you need to reboot due to an updated kernel'
arch=('i686' 'x86_64')
url="https://github.com/rnestler/reboot-arch-btw"
license=('GPL3')
makedepends=('rust' 'cargo')
depends=('dbus' 'xorg-xdpyinfo')
replaces=('kernel-updated')
source=("https://github.com/rnestler/reboot-arch-btw/archive/v${pkgver}.tar.gz")
sha256sums=('c846a1e47406a914fd8c998b475f55775b148cd39c7025ee000f287431630d47')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  cp -p target/release/${pkgname} "${pkgdir}/usr/bin"
}
