# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=libinput-xrandr-autorotate
pkgver=0.1.0
pkgrel=8
pkgdesc="Allows to rotate screen and touch input for 2-in-1 laptops"
url="https://github.com/AnatolyRugalev/libinput-xrandr-autorotate"
license=('GPLv3')
arch=('x86_64')
depends=()

source=("https://github.com/AnatolyRugalev/libinput-xrandr-autorotate/releases/download/${pkgver}/libinput-xrandr-autorotate_${pkgver}_Linux_amd64.tar.gz" "libinput-xrandr-autorotate.service")
sha256sums=('11d145f728357ff11009a0d3ab6f0b80010c73662030e2e3d31e8540248c355f' 'SKIP')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 libinput-xrandr-autorotate "$pkgdir/usr/bin/libinput-xrandr-autorotate"
  install -DT -m0755 "$srcdir/libinput-xrandr-autorotate.service" "$pkgdir/usr/lib/systemd/system/libinput-xrandr-autorotate.service"
}
