# Maintainer: Szabolcs Sipos <archur [at] balfug [dot] com>

buildarch=8

pkgname=raspberrypi-aarch64-directboot
pkgdesc="Boot linux-aarch64 on a Raspberry Pi without U-Boot"
pkgver=1
pkgrel=1
arch=(aarch64)
depends=('raspberrypi-bootloader' 'raspberrypi-devicetree' 'linux-aarch64')
conflicts=('uboot-raspberrypi')
license=(GPL2)
options=(!strip)
source=('config.txt' 'cmdline.txt')
md5sums=('SKIP' 'SKIP')
backup=('boot/config.txt' 'boot/cmdline.txt')

package() {
  mkdir -p "${pkgdir}"/boot
  cp "${srcdir}"/{config.txt,cmdline.txt} "${pkgdir}"/boot
}
