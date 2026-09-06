pkgname=snander-bin
pkgver=1.7.9.3
pkgrel=1
pkgdesc="SNANDer - Serial NOR/NAND/EEPROM programmer based on CH341A"
url="https://github.com/McMCCRU/SNANDer"
arch=('x86_64')
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
provides=('snander')
conflicts=('snander')
options=('!strip')

source=("SNANDer-v.$pkgver.tar.gz::https://github.com/McMCCRU/SNANDer/archive/refs/tags/v.$pkgver.tar.gz")
sha256sums=('a5715bbdb58c934644b4d29d7fdefd17b142a26c6100bfe4f2a54511d2efaf92')

package() {
  cd "$srcdir/SNANDer-v.$pkgver"
  install -Dm755 Linux/SNANDer "$pkgdir/usr/bin/snander"
  install -Dm644 Linux/40-persistent-ch341a.rules \
    "$pkgdir/usr/lib/udev/rules.d/40-persistent-ch341a.rules"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 src/libusb-1.0.27/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING.libusb"
}
