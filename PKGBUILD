# Maintainer: Szabolcs Sipos <archur [at] balfug [dot] com>

buildarch=28

pkgname=raspberrypi-devicetree-git
pkgdesc="Downstream devicetrees and overlays for Raspberry Pi"
pkgver=20220120
pkgrel=1
arch=('any')
url="https://github.com/raspberrypi/firmware"
provides=('raspberrypi-devicetree')
conflicts=('uboot-raspberrypi' 'linux-raspberrypi' 'linux-raspberrypi4')
license=(GPL2)
options=(!strip)
_commit=c6d56567ff6ef17fd85159770f22abcf2c5953ed
source=("https://github.com/raspberrypi/firmware/archive/${_commit}.tar.gz")
md5sums=('fb3890d4ae3f4caf432698e944989254')

package() {
  mkdir -p "${pkgdir}"/boot
  cp -r "${srcdir}"/firmware-${_commit}/boot/{*.dtb,overlays} "${pkgdir}"/boot
}
