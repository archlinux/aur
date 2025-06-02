# Maintainer: Igor Saric <karabaja4 at gmail.com>
# shellcheck disable=SC2148,SC2034,SC2154

pkgname=busybox-udhcpc
pkgver=1
pkgrel=2
pkgdesc="Busybox DHCP client"
arch=('x86_64')
url="https://www.busybox.net"
license=('GPL')
depends=('busybox')
source=("https://gitlab.alpinelinux.org/alpine/aports/-/raw/master/main/busybox/default.script")
sha256sums=('1cf94e3918ce389c722f4408490ae7334321a5ca2aec2c945b0c47662aa274a6')

package() {
  install -Dm755 "default.script" "${pkgdir}/usr/share/udhcpc/default.script"
  install -d "${pkgdir}/usr/bin"
  ln -sf "/usr/bin/busybox" "${pkgdir}/usr/bin/udhcpc"
}
