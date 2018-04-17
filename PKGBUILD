# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=raspberrypi-overlays
pkgdesc="Overlays files for Raspberry Pi"
pkgver=20180416
pkgrel=1
_commit=a154f2136850dba827cf4bc40794854376902cbd
arch=('any')
url="https://github.com/raspberrypi/firmware"
license=('custom')
options=(!strip)
# made depends on raspberrypi-bootloader to not allow to update raspberrypi-bootloader
# package without updating the raspberrypi-overlays
depends=("raspberrypi-bootloader=${pkgver}")
source=("https://github.com/raspberrypi/firmware/archive/${_commit}.tar.gz")
sha1sums=('3d21be65fdee2ab49c6866fc654f55f57634ac43')

package() {
  mkdir -p "${pkgdir}"/boot
  cp -R "${srcdir}"/firmware-${_commit}/boot/overlays "${pkgdir}"/boot
}
