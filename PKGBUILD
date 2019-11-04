# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=libinput-xrandr-autorotate
pkgver=0.1.0
pkgrel=12
pkgdesc="Allows to rotate screen and touch input for 2-in-1 laptops"
url="https://github.com/AnatolyRugalev/libinput-xrandr-autorotate"
license=('GPLv3')
arch=('x86_64')
depends=()

source=("https://github.com/AnatolyRugalev/libinput-xrandr-autorotate/releases/download/${pkgver}/libinput-xrandr-autorotate_${pkgver}_Linux_amd64.tar.gz" "libinput-xrandr-autorotate.service")
sha256sums=('d4bd2b6cc8c65e37210cb5e81c8e85743453b86d9539b1412723973c73eb41fd' 'SKIP')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 libinput-xrandr-autorotate "$pkgdir/usr/bin/libinput-xrandr-autorotate"
  install -DT -m0755 "$srcdir/libinput-xrandr-autorotate.service" "$pkgdir/usr/lib/systemd/system/libinput-xrandr-autorotate.service"
}
