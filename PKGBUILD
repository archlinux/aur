# Maintainer: Szabolcs Sipos <archur [at] balfug [dot] com>

buildarch=28

pkgname=raspberrypi-devicetree-git
pkgdesc="Downstream devicetrees and overlays for Raspberry Pi"
pkgver=20220328
pkgrel=1
arch=('any')
url="https://github.com/raspberrypi/firmware"
provides=('raspberrypi-devicetree')
conflicts=('uboot-raspberrypi' 'linux-raspberrypi' 'linux-raspberrypi4')
license=(GPL2)
options=(!strip)
_commit=69277bc713133a54a1d20554d79544da1ae2b6ca
source=("https://github.com/raspberrypi/firmware/archive/${_commit}.tar.gz")
md5sums=('7adf5f515a1a00066aab3fa7e0eb7d45')

package() {
  mkdir -p "${pkgdir}"/boot
  cp -r "${srcdir}"/firmware-${_commit}/boot/{*.dtb,overlays} "${pkgdir}"/boot
}
