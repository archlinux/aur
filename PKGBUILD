# $Id: PKGBUILD 111935 2014-05-27 07:39:44Z mtorromeo $
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=arcctl
pkgver=1.50.0
_buildver=170105
pkgrel=1
pkgdesc="CLI tools to manage Areca's ARC11xx/ARC12xx/ARC16xx/ARC18xx RAID controllers"
arch=('i686' 'x86_64')
url="http://www.areca.com.tw/support/s_linux/linux.htm"
license=('custom')
depends=('gcc-libs')
source=(http://www.areca.us/support/s_linux/driver/cli/linuxcli_V${pkgver}_${_buildver}.zip)
sha256sums=('0fa4025e81d631bc668aff3ff084a6984a7f7b3c7f6b5271bbdaeb4efc143ee2')

package() {
  if [ $CARCH == x86_64 ]; then
    install -Dm755 linuxcli_V${pkgver}_${_buildver}/x86_64/cli64 "$pkgdir"/usr/bin/arcctl
  else
    install -Dm755 linuxcli_V${pkgver}_${_buildver}/i386/cli32 "$pkgdir"/usr/bin/arcctl
  fi
}
