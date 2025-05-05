# Maintainer: Joshua Petitma <joshua@petit.dev>

_pkgname=rofi-mixer
pkgname="${_pkgname}-git"
pkgver=r22.3c55e38
pkgrel=2
pkgdesc='A script that generates a rofi menu that uses bluetoothctl to connect to bluetooth devices and display status info'
arch=('any')
url='https://github.com/joshpetit/rofi-mixer'
license=('GPL-3.0')
depends=('rofi' 'pulse-native-provider')
makedepends=('git')
source=("git+https://github.com/joshpetit/rofi-mixer.git")
md5sums=('SKIP')

prepare() {
  cd "${_pkgname}"
}

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  mkdir -p "${pkgdir}/opt/"

  install -D -m 755 ./src/rofi-mixer "${pkgdir}/usr/bin/rofi-mixer"
  install -D -m 755 ./src/rofi-mixer.py "${pkgdir}/usr/bin/rofi-mixer.py"
  install -D -m 644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 
}
