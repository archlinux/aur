# Maintainer: Jguer <joaogg3@gmail.com>
pkgname=usbbootgui-git
_pkgname=usbbootgui
pkgver=1e9cc0f
pkgrel=1
pkgdesc="GUI for booting a Raspberry Pi device like Pi Zero or compute module as a device"
arch=('any')
url="https://github.com/raspberrypi/usbbootgui"
license=('')
depends=(
  'libusb'
  'ncurses'
)
source=("git+https://github.com/raspberrypi/${_pkgname}.git")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make install
}
