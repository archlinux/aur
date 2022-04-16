# Maintainer: Szabolcs Sipos <archur [at] balfug [dot] com>

buildarch=28

pkgname=raspberrypi-devicetree-git
pkgdesc="Downstream devicetrees and overlays for Raspberry Pi"
pkgver=20220331
pkgrel=1
arch=('any')
url="https://github.com/raspberrypi/firmware"
provides=('raspberrypi-devicetree')
conflicts=('uboot-raspberrypi' 'linux-raspberrypi' 'linux-raspberrypi4')
license=(GPL2)
options=(!strip)
_commit=61966732d03de9b71baf561f920e018b54c241ac
source=("https://github.com/raspberrypi/firmware/archive/${_commit}.tar.gz")
md5sums=('b8c1249fb99e8fb692c44c2cff2d486a')

package() {
  mkdir -p "${pkgdir}"/boot
  cp -r "${srcdir}"/firmware-${_commit}/boot/{*.dtb,overlays} "${pkgdir}"/boot
}
