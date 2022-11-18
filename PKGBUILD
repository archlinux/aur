# Maintainer: Igor Saric <karabaja4 at gmail.com>
# shellcheck disable=SC2148,SC2034,SC2154

pkgname=busybox-udhcpc
pkgver=1
pkgrel=1
pkgdesc="Busybox DHCP client"
arch=('x86_64')
url="https://www.busybox.net"
license=('GPL')
depends=('busybox')
source=("https://gitlab.alpinelinux.org/alpine/aports/-/raw/master/main/busybox/default.script")
sha256sums=('c4e5a7c4783a7a73dec48dee009ee687015d2de7ff86b269679b95bef2c60e13')

package() {
  install -Dm755 "default.script" "${pkgdir}/usr/share/udhcpc/default.script"
  install -d "${pkgdir}/usr/bin"
  ln -sf "/usr/bin/busybox" "${pkgdir}/usr/bin/udhcpc"
}
