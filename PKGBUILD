# Maintainer: Oliver Ford <dev.aur@ojford.com>
pkgname=tlp-rdw-systemd
pkgver=1.0.0
pkgrel=1
pkgdesc="TLP Radio-Device-Watchdog simulated from systemd-networkd (without NetworkManager)"

arch=('any')
url="https://github.com/OJFord/tlp-rdw-systemd"
license=('GPL-3.0-or-later')

depends=(
    'systemd'
    'tlp'
)
conflicts=(
    'tlp-rdw'
)
source=(
    'tlp-rdw.path'
    'tlp-rdw.service'
    'tlp-rdw-simulator'
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

install=${pkgname}.install
package() {
  install -Dm644 tlp-rdw.path "$pkgdir/usr/lib/systemd/system/tlp-rdw.path"
  install -Dm644 tlp-rdw.service "$pkgdir/usr/lib/systemd/system/tlp-rdw.service"
  install -Dm755 tlp-rdw-simulator "$pkgdir/usr/bin/tlp-rdw-simulator"
}
