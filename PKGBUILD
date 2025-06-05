# Maintainer: Sakari <sk308269317@outlook.com>

pkgname=uuplugin-bin
pkgver=9.0.0
pkgrel=1
pkgdesc="UU Steam Deck Plugin for General Linux"
arch=('x86_64')
url="https://uu.163.com/"
license=('custom')
source=(
  "https://uu.gdl.netease.com/uuplugin/steam-deck-plugin-x86_64/v${pkgver}/uu.tar.gz"
  'uuplugin.service')
md5sums=('ee7c9c958001948a9f7b77a0512c11ba'
  '3d8004125dbbea0b07b6c2e3ff225767')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/etc/uuplugin"
  install -Dm755 "${srcdir}/uuplugin" "${pkgdir}/usr/bin/uuplugin"
  install -Dm644 "${srcdir}/uu.conf" "${pkgdir}/etc/uuplugin/uu.conf"
  install -Dm644 "${srcdir}/uuplugin.service" "${pkgdir}/usr/lib/systemd/system/uuplugin.service"
}
