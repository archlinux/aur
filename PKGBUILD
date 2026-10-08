# Maintainer: Davi Alves Sampaio <davialvessampaio00@gmail.com>
#
# This is the TEMPLATE for the AUR package. Do not bump pkgver/pkgrel or
# checksums here by hand: scripts/publish-aur.sh sets them when publishing.
# Edit this file only to change packaging (dependencies, install steps, ...).

pkgname=simple-battery-notify
pkgver=2.2.0
pkgrel=1
pkgdesc="Customizable battery notifications from UPower: a small daemon and CLI"
arch=('any')
url="https://github.com/Davi-S/simple-battery-notify"
license=('GPL-3.0-or-later')
depends=('bash' 'systemd' 'glib2' 'libnotify' 'upower')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('356d6f360f7b5f0ba0e4e097d79600be69ae4d7dd58b8b7fe45381feda878f68')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
