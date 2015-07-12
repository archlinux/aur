# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
# Based on package by Jelle van der Waa <jelle vdwaa nl>.
pkgname=networkmanager-dispatcher-pdnsd
pkgver=2.1
pkgrel=1
pkgdesc='Dispatcher Script for pDNSd; works with systemd and sysvinit'
arch=(any)
license=('MIT')
url='https://wiki.gnome.org/Projects/NetworkManager'
depends=('networkmanager' 'pdnsd')
backup=(etc/NetworkManager/dispatcher.d/00-pdnsd)
changelog=ChangeLog
source=('00-pdnsd' 'LICENSE')
sha256sums=('586da6d5e87185ad4c00cdcdaae666a0a777fda477c652355bf826851da66814'
            'dcadbc70cabe99658c2ec966cbec7134514fbe8894b1fe7bd5f3ccbaf643825a')

package() {
  install -Dm700 "$srcdir/00-pdnsd" "$pkgdir/etc/NetworkManager/dispatcher.d/00-pdnsd"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
