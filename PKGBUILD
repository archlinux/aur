# Author: Julian Xhokaxhiu <info@julianxhokaxhiu.com>
pkgname=chromium-fullscreen
pkgver=1
pkgrel=1
pkgdesc="Systemd service and user to run Chromium in fullscreen mode"
url=""
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('MIT')
depends=('xorg-server' 'xorg-xrandr' 'xorg-xinit' 'chromium')
install='chromium-fullscreen.install'
source=('chromium-fullscreen.service'
        'chromium-fullscreen.sysuser'
        'chromium-fullscreen.sh')
md5sums=('738beda830fcf4f094b83659c9c936c4'
         '9e979fbdd1e4a5a04fd0e91ce6a9a7be'
         '4f88ade0f45fa6358cd942881229b873')

package() {
  # Copy autorun script
  install -Dm644 ${srcdir}/chromium-fullscreen.sh "$pkgdir/home/chromium/.systemd/chromium-fullscreen.sh"

  #Install service file
  install -Dm644 ${srcdir}/chromium-fullscreen.service "$pkgdir/usr/lib/systemd/system/chromium-fullscreen.service"

  #Install sysuser config
  install -Dm644 ${srcdir}/chromium-fullscreen.sysuser "$pkgdir/usr/lib/sysusers.d/chromium-fullscreen.conf"
}
