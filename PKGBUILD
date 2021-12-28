# Maintainer: Johan Förberg <johan@forberg.se>
pkgname=dmenu-bluetooth
pkgver=r31.c1a5c7b
pkgrel=1
pkgdesc='A dmenu menu that uses bluetoothctl to connect to bluetooth devices and display status'
arch=(any)
url='https://github.com/Layerex/dmenu-bluetooth'
license=(GPL3)
depends=(bluez-utils)
makedepends=(git)
source=(dmenu-bluetooth::git+"https://github.com/Layerex/dmenu-bluetooth.git")
md5sums=(SKIP)

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -m755 -t "$pkgdir"/usr/bin/ -D dmenu-bluetooth
}
