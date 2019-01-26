# $Id: PKGBUILD 111935 2014-05-27 07:39:44Z mtorromeo $
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=arcctl
pkgver=1.15.8
pkgrel=1
_buildver=180529
pkgrel=1
pkgdesc="CLI tools to manage Areca's ARC11xx/ARC12xx/ARC16xx/ARC18xx RAID controllers"
arch=('i686' 'x86_64')
url="https://www.areca.us/support/s_linux/linux.htm"
license=('custom')
depends=('gcc-libs')
source=(https://www.areca.us/support/s_linux/driver/cli/linuxcli_V${pkgver}_${_buildver}.zip)
sha256sums=('c73a1e80cc0e23d0940259c1a3efd2aad7d906c93b5c7556277623bf394323d2')

package() {
  if [ $CARCH == x86_64 ]; then
    install -Dm755 linuxcli_V${pkgver}_${_buildver}/x86_64/cli64 "$pkgdir"/usr/bin/arcctl
  else
    install -Dm755 linuxcli_V${pkgver}_${_buildver}/i386/cli32 "$pkgdir"/usr/bin/arcctl
  fi
}
