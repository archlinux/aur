# Maintainer: Igor Saric <karabaja4 at gmail.com>
# shellcheck disable=SC2148,SC2034,SC2154

pkgname=busybox-udhcpc
pkgver=1
pkgrel=4
pkgdesc="Busybox DHCP client"
arch=('x86_64')
url="https://www.busybox.net"
license=('GPL')
depends=('busybox')
source=("https://gitlab.alpinelinux.org/alpine/aports/-/raw/master/main/busybox/default.script"
        "https://gitlab.alpinelinux.org/alpine/aports/-/raw/master/main/busybox/udhcpc.conf")
sha256sums=('c7b39bba4d7f1ce05dbdeba7d2fd97b96a8c3c0c1ebc0259f641fb8e1c3827d2'
            '5b372209e01cda07c87b8afa6d1ab3d7e8daf18a1f2332d744203a6dc289eb1a')

package() {
  install -Dm755 "default.script" "${pkgdir}/usr/share/udhcpc/default.script"
  install -Dm644 "udhcpc.conf" "${pkgdir}/etc/udhcpc/udhcpc.conf"
  install -d "${pkgdir}/usr/bin"
  ln -sf "/usr/bin/busybox" "${pkgdir}/usr/bin/udhcpc"
}
