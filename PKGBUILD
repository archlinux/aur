# Maintainer: bitscoper <bitscoper@gmail.com>

pkgname=bitscoper-usb-logger
pkgdesc="Monitors udev USB events and logs device attributes."
url="https://github.com/bitscoper/Bitscoper_USB_Logger/"
license=("GPL3")
provides=("bitscoper-usb-logger")
makedepends=("base-devel" "make" "gcc")
# depends=("")
# checkdepends=("")
# optdepends=("")
options=(!debug)
# install="${pkgname%}.install"
source=("https://raw.githubusercontent.com/bitscoper/Bitscoper_USB_Logger/main/Bitscoper_USB_Logger.c")
sha256sums=("SKIP")
arch=("x86_64")
pkgver=1
pkgrel=2

build() {
  gcc ./Bitscoper_USB_Logger.c -o ./Bitscoper_USB_Logger -ludev
}

package() {
  install -dm755 "$pkgdir/usr/bin"
  mv "$srcdir/Bitscoper_USB_Logger" "$pkgdir/usr/bin/Bitscoper_USB_Logger"
}
