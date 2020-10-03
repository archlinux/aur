# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=sakura-frp
pkgver=0.33.0_sakura_6
pkgrel=2
pkgdesc="Sakura Frp"
arch=('x86_64' 'i686' 'aarch64' 'armv6h' 'armv7h' 'arm')
url="https://www.natfrp.com/"
license=('unknown')
provides=('sakura-frpc' 'natfrp')
source=("${pkgname}c.service")
backup=("etc/${pkgname}/frpc.ini")
source_x86_64=("https://qianqu.me/frp/frpc_linux_amd64")
source_i686=("https://qianqu.me/frp/frpc_linux_386")
source_arm=("https://qianqu.me/frp/frpc_linux_arm")
source_armv7h=("https://qianqu.me/frp/frpc_linux_arm")
source_armv6h=("https://qianqu.me/frp/frpc_linux_arm")
source_aarch64=("https://qianqu.me/frp/frpc_linux_arm64")

md5sums=('dce2e42326d67f190373fb5303d9592f')
md5sums_x86_64=('365e027265c6548b862d022c079faf62')
md5sums_i686=('c94b5adacb30b28dc5003ed97f94a0c9')
md5sums_aarch64=('2d65556d917628c04bafe3213864b6d6')
md5sums_armv6h=('0ceea6a1bdbbd6dd9068a88bb2cd1c93')
md5sums_armv7h=('0ceea6a1bdbbd6dd9068a88bb2cd1c93')
md5sums_arm=('0ceea6a1bdbbd6dd9068a88bb2cd1c93')

package() {
  install -Dm755 frpc_linux_* ${pkgdir}/usr/bin/${pkgname}c

  # frpc.ini
  install -dm755 ${pkgdir}/etc/${pkgname}
  touch ${pkgdir}/etc/${pkgname}/frpc.ini

  # systemd service
  install -Dm644 ${pkgname}c.service -t ${pkgdir}/usr/lib/systemd/system/
}

# vim: set sw=2 ts=2 et:
