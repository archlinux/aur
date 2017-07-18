# $Id$
# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=bluez-hcitool
pkgver=5.45
pkgrel=1
pkgdesc="deprecated rfcomm tool from bluez"
url="http://www.bluez.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=("bluez")
source=(hcitool.1 hcitool.c oui.c oui.h)
sha256sums=('45859b67a919802a8641b951f701dc4a7d73a82e229efa31864d6d35003883c2'
            'a0e5f6507f4ee2beeb68478bfb8f3cb155e8c9c0b4b9eb21b2b0bc5ca472b47d'
            'a6b5991b821a9bc7ff397e31481f86fd3bb1fe387a2f258ec8321075cded7836'
            'b147788869cfc559b4433a9f4c0d6764ec7b66a488507876598d96556842dfe9')

build() {
  gcc hcitool.c oui.c -lbluetooth -o hcitool -DVERSION=\"$pkgver\"
}

package() {
  install -Dm0755 hcitool "$pkgdir"/usr/bin/hcitool
  install -Dm0755 hcitool.1 "$pkgdir"/usr/share/man/man1/hcitool.1
}
