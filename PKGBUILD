# Author: Julian Xhokaxhiu <info@julianxhokaxhiu.com>
pkgname=retroarch-standalone-service
pkgver=1
pkgrel=5
pkgdesc="Systemd service and user to run Retroarch in stand-alone mode"
url=""
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('MIT')
depends=('retroarch' 'retroarch-assets-xmb' 'retroarch-autoconfig-udev')
install='retroarch-standalone.install'
source=('retroarch-standalone.service'
        'retroarch-standalone.sysuser'
        'retroarch-standalone.cfg')
md5sums=('f343d54c49ad60102c6020c64673b1c9'
         '184504e1f87c87fa28f62c1341fef05c'
         '5206927b9568f5dfd868d65aad781df5')

package() {
  # Copy additional configuration file to /etc
  install -Dm644 ${srcdir}/retroarch-standalone.cfg "$pkgdir/etc/retroarch-standalone.cfg"

  #Install service file
  install -Dm644 ${srcdir}/retroarch-standalone.service "$pkgdir/usr/lib/systemd/system/retroarch-standalone.service"

  #Install sysuser config
  install -Dm644 ${srcdir}/retroarch-standalone.sysuser "$pkgdir/usr/lib/sysusers.d/retroarch-standalone.conf"
}
