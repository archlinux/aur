# Maintainer: Fortunato Ventre (voRia) <vorione AT gmail DOT com>

pkgname=samsung-tools
pkgver=2.3.1
pkgrel=1
pkgdesc="Tools for Samsung laptops"
arch=('any')
url="https://launchpad.net/samsung-tools"
license=('GPL3')
depends=('pm-utils' 'xbindkeys' 'rfkill' 'python2-dbus' 'dbus-glib' 'python2-notify' 'vbetool')
optdepends=('phc-intel: for CPU undervolting')
backup=(etc/samsung-tools/system.conf
        etc/samsung-tools/session.conf
        etc/samsung-tools/scripts/bluetooth-on
        etc/samsung-tools/scripts/bluetooth-off
        etc/samsung-tools/scripts/wireless-on
        etc/samsung-tools/scripts/wireless-off)
install=samsung-tools.install
source=(http://launchpad.net/samsung-tools/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('aaf2f0cf07000c826e5cae23dedf0999')
         
package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install || return 1
}

# vim:set ts=2 sw=2 et:
