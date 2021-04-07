# $Id$
# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=bluez-rfcomm
pkgver=5.58
pkgrel=1
pkgdesc="deprecated rfcomm tool from bluez"
url="http://www.bluez.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=("bluez")
source=(https://www.kernel.org/pub/linux/bluetooth/bluez-${pkgver}.tar.xz)
sha256sums=('c8065e75a5eb67236849ef68a354b1700540305a8c88ef0a0fd6288f19daf1f1')

build() {
  cd bluez-${pkgver}/tools
  gcc rfcomm.c -lbluetooth -o rfcomm -DVERSION=\"$pkgver\" -I..
}

package() {
  cd bluez-${pkgver}/tools
  install -Dm0755 rfcomm "$pkgdir"/usr/bin/rfcomm
  install -Dm0755 rfcomm.1 "$pkgdir"/usr/share/man/man1/rfcomm.1
}
