# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Peter <craven@gmx.net>

pkgname=pktriggercord
pkgver=0.85.00
pkgrel=1
pkgdesc="Remote control (tethering) for Pentax DSLR cameras"
arch=(i686 x86_64 armv6h armv7h aarch64)
url="https://pktriggercord.melda.info/"
license=(LGPL3)
depends=(gtk2)
source=("https://github.com/asalamon74/pktriggercord/releases/download/v${pkgver}/pkTriggerCord-${pkgver}.src.tar.gz")
sha256sums=('9a6ee80e8b786f89a6ddb87e9afa14e2c72187e9614bbeda7ef6d7f383ffbe06')

package() {
  cd "${pkgname}-${pkgver}"
  CFLAGS+=" -Isrc/external/js0n"
  make LDFLAGS=-lm PREFIX=/usr DESTDIR="$pkgdir/" install
}
