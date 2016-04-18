# $Id: PKGBUILD 111935 2014-05-27 07:39:44Z mtorromeo $
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=arcctl
pkgver=1.14.7
_buildver=150519
pkgrel=1
pkgdesc="CLI tools to manage Areca's ARC11xx/ARC12xx/ARC16xx/ARC18xx RAID controllers"
arch=('i686' 'x86_64')
url="http://www.areca.com.tw/support/s_linux/linux.htm"
license=('custom')
depends=('gcc-libs')
source=(http://www.areca.us/support/s_linux/cli/linuxcli_V${pkgver}_${_buildver}.zip)
sha256sums=('3467c331435ab6df5d2f6df86fde6da579c861e498edfc900a7a5a8e3ed9fb4e')

package() {
  if [ $CARCH == x86_64 ]; then
    install -Dm755 linuxcli_V${pkgver}_${_buildver}/x86_64/cli64 "$pkgdir"/usr/bin/arcctl
  else
    install -Dm755 linuxcli_V${pkgver}_${_buildver}/i386/cli32 "$pkgdir"/usr/bin/arcctl
  fi
}
