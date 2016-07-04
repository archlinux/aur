# Maintainer: Alf <naihe2010 at 126.com>

pkgname=openvas-script
pkgver=1.0
pkgrel=0
pkgdesc="openvas-setup/openvas-start/openvas-stop script"
arch=('any')
license=('unknown')
url="http://www.openvas.org/"
depends=('openvas-scanner' 'openvas-manager' 'openvas-cli' 'greenbone-security-assistant')
replaces=()
conflicts=()
source=("greenbone-security-assistant.service" "openvas-manager.service" "openvassd.conf" "openvas-setup" "openvas-start" "openvas-stop")
sha1sums=('365f23d6a2c090b5e34a20767ef5d7e86d54de6b' '77beaf32e2670cfed7e4372146205a1694dd4daa' '1b58f461da39cc54d201813d64ef8b598b656da4' 'adec95aebf7e090685a63e2dab9f090b42795d2b' '719f18f4a9d33884b7938276f450082d2184fb94' '36faa124fb08a24dbae6d9a8d2a387b48467a294')

package() {
  install -d "$pkgdir/usr/lib/systemd/system"
  install -m644 greenbone-security-assistant.service "$pkgdir/usr/lib/systemd/system/"
  install -m644 openvas-manager.service "$pkgdir/usr/lib/systemd/system/"
  install -d "$pkgdir/etc/openvas"
  install -m644 openvassd.conf "$pkgdir/etc/openvas/"
  install -d "$pkgdir/usr/bin"
  install -m755 openvas-setup "$pkgdir/usr/bin/"
  install -m755 openvas-start "$pkgdir/usr/bin/"
  install -m755 openvas-stop "$pkgdir/usr/bin/"
}
