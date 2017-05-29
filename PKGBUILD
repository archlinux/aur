# $Id$
# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=bluez-rfcomm
pkgver=5.45
pkgrel=1
pkgdesc="deprecated rfcomm tool from bluez"
url="http://www.bluez.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=("bluez")
source=(rfcomm.c rfcomm.1)
sha256sums=('d7a382344ceb1b9095cbb45d1d3f9fe4509ebddf44647c7641a812ccc0540c02'
            'fd06cdd4ee0981c365c0acf5e00405e66b8af5ffbdec9d2fdaaf03c6fbaba057')

build() {
  gcc rfcomm.c -lbluetooth -o rfcomm -DVERSION=\"$pkgver\"
}

package() {
  install -Dm0755 rfcomm "$pkgdir"/usr/bin/rfcomm
  install -Dm0755 rfcomm.1 "$pkgdir"/usr/share/man/man1/rfcomm.1
}
