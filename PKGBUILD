# $Id$
# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=bluez-rfcomm
pkgver=5.66
pkgrel=1
pkgdesc="deprecated rfcomm tool from bluez"
url="http://www.bluez.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=("bluez")
source=(https://www.kernel.org/pub/linux/bluetooth/bluez-${pkgver}.tar.xz)
sha256sums=('39fea64b590c9492984a0c27a89fc203e1cdc74866086efb8f4698677ab2b574')

build() {
  cd bluez-${pkgver}
  gcc tools/rfcomm.c lib/bluetooth.c lib/hci.c -o tools/rfcomm -DVERSION=\"$pkgver\" -I.
}

package() {
  cd bluez-${pkgver}/tools
  install -Dm0755 rfcomm "$pkgdir"/usr/bin/rfcomm
  install -Dm0755 rfcomm.1 "$pkgdir"/usr/share/man/man1/rfcomm.1
}
