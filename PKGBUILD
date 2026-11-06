# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=quickshell-d77
pkgver=1.6.0
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
sha256sums=('27bdf9f2efe1c21ca7ae91b8589494a0199ace42054c59f98ea05a9bffb0a462')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
