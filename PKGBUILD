# Maintainer: Szabolcs Sipos <archur [at] balfug [dot] com>

buildarch=28

pkgname=raspberrypi-devicetree-git
pkgdesc="Downstream devicetrees and overlays for Raspberry Pi"
pkgver=20211029
pkgrel=1
arch=('any')
url="https://github.com/raspberrypi/firmware"
provides=('raspberrypi-devicetree')
conflicts=('uboot-raspberrypi' 'linux-raspberrypi' 'linux-raspberrypi4')
license=(GPL2)
options=(!strip)
_commit=e2bab29767e51c683a312df20014e3277275b8a6
source=("https://github.com/raspberrypi/firmware/archive/${_commit}.tar.gz")
md5sums=('2f3059f26d5572126051430c8ba8198a')

package() {
  mkdir -p "${pkgdir}"/boot
  cp -r "${srcdir}"/firmware-${_commit}/boot/{*.dtb,overlays} "${pkgdir}"/boot
}
