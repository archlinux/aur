# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=reflector-mirrorlist
pkgver=1.0.0
pkgrel=1
pkgdesc="Auto-updating mirror list for use by pacman"
arch=("x86_64")
url="https://github.com/swaywm/sway"
license=('MIT')
provides=('pacman-mirrorlist')
depends=("systemd" "reflector")
install="${pkgname}.install"
source=("reflector-mirrorlist.service"
        "reflector-mirrorlist.timer")
md5sums=('63bff5e7683a591b46a0713da92ef403'
         '1ceafcc15430e392d2cfd3152a0b1e8f')

package() {
  cd "$srcdir"

  install -Dm 644 reflector-mirrorlist.service \
    "$pkgdir/etc/systemd/system/reflector-mirrorlist.service"
  install -Dm 644 reflector-mirrorlist.timer \
    "$pkgdir/etc/systemd/system/reflector-mirrorlist.timer"
}
