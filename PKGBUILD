# Maintainer: Davi Alves Sampaio <davialvessampaio00@gmail.com>
#
# This is the TEMPLATE for the AUR package. Do not bump pkgver/pkgrel or
# checksums here by hand: scripts/publish-aur.sh sets them when publishing.
# Edit this file only to change packaging (dependencies, install steps, ...).

pkgname=simple-battery-notify
pkgver=2.1.0
pkgrel=2
pkgdesc="Customizable battery notifications from UPower: a small daemon and CLI"
arch=('any')
url="https://github.com/Davi-S/simple-battery-notify"
license=('GPL-3.0-or-later')
depends=('bash' 'systemd' 'glib2' 'libnotify' 'upower')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('476753b2ba8e1c3597b11da46c91d78bdbea2882ffdf877ad5719e6acec1e34c')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
