# $Id$
# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=bluez-rfcomm
pkgver=5.63
pkgrel=2
pkgdesc="deprecated rfcomm tool from bluez"
url="http://www.bluez.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=("bluez")
source=(https://www.kernel.org/pub/linux/bluetooth/bluez-${pkgver}.tar.xz)
sha256sums=('9349e11e8160bb3d720835d271250d8a7424d3690f5289e6db6fe07cc66c6d76')

build() {
  cd bluez-${pkgver}
  gcc tools/rfcomm.c lib/bluetooth.c lib/hci.c -o tools/rfcomm -DVERSION=\"$pkgver\" -I.
}

package() {
  cd bluez-${pkgver}/tools
  install -Dm0755 rfcomm "$pkgdir"/usr/bin/rfcomm
  install -Dm0755 rfcomm.1 "$pkgdir"/usr/share/man/man1/rfcomm.1
}
