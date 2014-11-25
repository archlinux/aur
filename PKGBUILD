# $Id: PKGBUILD 111935 2014-05-27 07:39:44Z mtorromeo $
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=arcctl
pkgver=1.14.2
_buildver=140528
pkgrel=1
pkgdesc="CLI tools to manage Areca's ARC11xx/ARC12xx/ARC16xx/ARC18xx RAID controllers"
arch=('i686' 'x86_64')
url="http://www.areca.com.tw/support/s_linux/linux.htm"
license=('custom')
source=(http://www.areca.us/support/s_linux/cli/linuxcli_V${pkgver}_${_buildver}.zip)
sha256sums=('ee7dc5a300c3e4eaf47c80a9987a8842405d3da8735e78e9c294dad725254b26')

package() {
  if [ $CARCH == x86_64 ]; then
    install -Dm755 linuxcli_V${pkgver}_${_buildver}/x86_64/cli64 "$pkgdir"/usr/bin/arcctl
  else
    install -Dm755 linuxcli_V${pkgver}_${_buildver}/i386/cli32 "$pkgdir"/usr/bin/arcctl
  fi
}
