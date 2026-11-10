# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=quickshell-d77
pkgver=1.6.1
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
optdepends=('matugen: wallpaper-based color palette')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('033c01aca6850b96ab7bea44e8b784b9c93c62565a3a98f321b71b2a2a978c7b')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
