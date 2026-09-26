# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=quickshell-d77
pkgver=1.4.4
pkgrel=1
pkgdesc="Quickshell d77 shell for Wayland compositors"
arch=('any')
url="https://github.com/dani-77/quickshell-d77"
license=('MIT')
# Unlike the Void template, quickshell is listed here: an unversioned
# dependency never holds back pacman upgrades.
depends=('quickshell' 'power-profiles-daemon' 'alsa-utils' 'alsa-tools'
         'brightnessctl' 'wireless_tools')
makedepends=('rsync')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('28797d34a5447a3c1326835fa129a6701d3633b8b82a17ff5aa9f8d5c614d43e')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
