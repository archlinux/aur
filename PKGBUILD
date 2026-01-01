# Maintainer: Igor Saric <karabaja4 at gmail.com>
# shellcheck disable=SC2148,SC2034,SC2154

pkgname=busybox-udhcpc
pkgver=1
pkgrel=3
pkgdesc="Busybox DHCP client"
arch=('x86_64')
url="https://www.busybox.net"
license=('GPL')
depends=('busybox')
source=("https://gitlab.alpinelinux.org/alpine/aports/-/raw/master/main/busybox/default.script")
sha256sums=('c7b39bba4d7f1ce05dbdeba7d2fd97b96a8c3c0c1ebc0259f641fb8e1c3827d2')

package() {
  install -Dm755 "default.script" "${pkgdir}/usr/share/udhcpc/default.script"
  install -d "${pkgdir}/usr/bin"
  ln -sf "/usr/bin/busybox" "${pkgdir}/usr/bin/udhcpc"
}
