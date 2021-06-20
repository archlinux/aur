# Maintainer: Jguer <joaogg3@gmail.com>
pkgname=usbboot-git
_pkgname=usbboot
pkgver=2048ae6
pkgrel=1
pkgdesc="GUI for booting a Raspberry Pi device like Pi Zero or compute module as a device"
arch=('any')
url="https://github.com/raspberrypi/usbboot"
license=('')
depends=(
  'libusb'
)
source=("git+https://github.com/raspberrypi/${_pkgname}.git")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "$pkgdir/usr/share/rpiboot/LICENSE"
  install -Dm755 "${srcdir}/${_pkgname}/bin2c" "$pkgdir/usr/bin/bin2c"
  install -Dm755 "${srcdir}/${_pkgname}/rpiboot" "$pkgdir/usr/bin/rpiboot"
}
