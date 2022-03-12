# Maintainer: Szabolcs Sipos <archur [at] balfug [dot] com>

buildarch=28

pkgname=raspberrypi-devicetree-git
pkgdesc="Downstream devicetrees and overlays for Raspberry Pi"
pkgver=20220308
pkgrel=1
arch=('any')
url="https://github.com/raspberrypi/firmware"
provides=('raspberrypi-devicetree')
conflicts=('uboot-raspberrypi' 'linux-raspberrypi' 'linux-raspberrypi4')
license=(GPL2)
options=(!strip)
_commit=191360eaf2e5933eaa0ed76ac0d62722b6f9a58f
source=("https://github.com/raspberrypi/firmware/archive/${_commit}.tar.gz")
md5sums=('c62776b7d10cf082f755b0f8ddd2e51b')

package() {
  mkdir -p "${pkgdir}"/boot
  cp -r "${srcdir}"/firmware-${_commit}/boot/{*.dtb,overlays} "${pkgdir}"/boot
}
