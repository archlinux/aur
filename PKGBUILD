# Maintainer: Nikolas Koesling <nikolas@koesling.info>
pkgname=tmog-noroot-config
pkgver=1.0.0
pkgrel=1
pkgdesc="add groups and config according to https://tmog.org/linux.html"
arch=(any)
url="https://tmog.org/linux.html"
license=('GPL-2.0-or-later')
depends=('tmog-task-manager' 'systemd')
install=$pkgname.install
source=("$pkgname.sysusers"
        '90-powercap-readers.rules'
        'dmi-readers.conf')
sha256sums=('57488f9bb10037edf6e27b8dd80b9d46a78f20166d052af73927a78bdf608c5d'
            '8168097cabffaf692e5e2d46b89fd5a293f0e93d91bc0b543e3215e488f9b26b'
            '0d5d3e09c013502aa47fa90f62bd435565cb183189f7435e997e2e6d9992d41f')

package() {
  install -Dm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 90-powercap-readers.rules "$pkgdir/usr/lib/udev/rules.d/90-powercap-readers.rules"
  install -Dm644 dmi-readers.conf "$pkgdir/usr/lib/tmpfiles.d/dmi-readers.conf"
}
