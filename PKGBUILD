pkgname=dkms-hid-sony-shanwan
_pkgname=hid-sony
pkgver=1
pkgrel=1
pkgdesc='The hid-sony driver patched to fix the non-stop rumbling bug with the Shanwan gamepads (clones of Dualshock 3)'
url='https://github.com/raspberrypi/linux/commit/492ca83c3d19fba1622164f07cd7b775596a7db2'
arch=('i686' 'x86_64')
license=('GPL')
depends=('dkms')
makedepends=('linux-headers')

source=('Makefile'
        'dkms.conf'
        'hid-sony.c'
        'hid-ids.h')

md5sums=('5cbe7c99718d8b1486b22bf727018fab'
         '56200443eb4c01b755de1ec7c423eadc'
         'b79d3c0ce5f2734df35ecf11ea07f572'
         '2422777cff8d52214762dccb0bd062ea')

install=hid-sony.install

package() {
  cd "${srcdir}"
  mkdir -p ${pkgdir}/usr/src/${_pkgname}-${pkgver}
  cp -L Makefile ${pkgdir}/usr/src/${_pkgname}-${pkgver}
  cp -L dkms.conf ${pkgdir}/usr/src/${_pkgname}-${pkgver}
  cp -L hid-sony.c ${pkgdir}/usr/src/${_pkgname}-${pkgver}
  cp -L hid-ids.h ${pkgdir}/usr/src/${_pkgname}-${pkgver}
}
