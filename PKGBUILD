# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=raspberrypi-overlays
pkgdesc="Overlays files for Raspberry Pi"
pkgver=20180409
pkgrel=1
_commit=d46b40bd04e795c592b3d8ebcfb0620b93b9107c
arch=('any')
url="https://github.com/raspberrypi/firmware"
license=('custom')
options=(!strip)
# made depends on raspberrypi-bootloader to not allow to update raspberrypi-bootloader
# package without updating the raspberrypi-overlays
depends=("raspberrypi-bootloader=${pkgver}")
source=("https://github.com/raspberrypi/firmware/archive/${_commit}.tar.gz")
sha1sums=('04803986f5bda2dbc6c1de7d86be4b13c655839f')

package() {
  mkdir -p "${pkgdir}"/boot
  cp -R "${srcdir}"/firmware-${_commit}/boot/overlays "${pkgdir}"/boot
}
