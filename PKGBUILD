# Maintainer: Alec Mev <alec@mev.earth>

_pkgname=rofi-bluetooth
pkgname="${_pkgname}-git"
pkgver=r33.9d91c04
pkgrel=1
pkgdesc='A script that generates a rofi menu that uses bluetoothctl to connect to bluetooth devices and display status info'
arch=('any')
url='https://github.com/nickclyde/rofi-bluetooth'
license=('GPL-3.0')
depends=('rofi' 'bluez-utils')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/nickclyde/rofi-bluetooth.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -D -m 755 -t "${pkgdir}/usr/bin/" rofi-bluetooth
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${_pkgname}/" LICENSE
}
