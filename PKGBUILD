# Maintainer: rnestler

pkgname=reboot-arch-btw
pkgver=0.1.2
pkgrel=1
pkgdesc='Check if you need to reboot due to an updated kernel'
arch=('i686' 'x86_64')
url="https://github.com/rnestler/reboot-arch-btw"
license=('GPL3')
makedepends=('rust' 'cargo')
depends=('dbus')
replaces=('kernel-updated')
source=("https://github.com/rnestler/reboot-arch-btw/archive/v${pkgver}.tar.gz")
sha256sums=('64ba53fab74bfbf9befc4ea38fb96f065bef150487c9d158b6a21a6c57d7d9cd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  cp -p target/release/${pkgname} "${pkgdir}/usr/bin"
}
