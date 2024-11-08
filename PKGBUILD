# Maintainer: Sakari <sk308269317@outlook.com>

pkgname=uuplugin-bin
pkgver=7.12.12
pkgrel=1
pkgdesc="UU Steam Deck Plugin for General Linux"
arch=('x86_64')
url="https://uu.163.com/"
license=('custom')
source=(
  "https://uu.gdl.netease.com/uuplugin/steam-deck-plugin-x86_64/v${pkgver}/uu.tar.gz"
  'uuplugin.service')
md5sums=('d5776e205e11393b8a4e8c133df68a98'
         '3d8004125dbbea0b07b6c2e3ff225767')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/etc/uuplugin"
  install -Dm755 "${srcdir}/uuplugin" "${pkgdir}/usr/bin/uuplugin"
  install -Dm644 "${srcdir}/uu.conf" "${pkgdir}/etc/uuplugin/uu.conf"
  install -Dm644 "${srcdir}/uuplugin.service" "${pkgdir}/usr/lib/systemd/system/uuplugin.service"
}
