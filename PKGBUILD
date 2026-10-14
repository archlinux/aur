# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=utumno
pkgver=0.2.0
pkgrel=1
pkgdesc="Minimal Quickshell shell for Wayland compositors, lighter sibling of quickshell-d77"
arch=('any')
url="https://github.com/dani-77/utumno"
license=('MIT')
# Unlike the Void template, quickshell is listed here: an unversioned
# dependency never holds back pacman upgrades.
depends=('quickshell' 'power-profiles-daemon' 'alsa-utils' 'alsa-tools'
         'brightnessctl' 'wireless_tools')
makedepends=('rsync')
optdepends=(
  'upower: battery widget'
  'networkmanager: network widget'
  'matugen: wallpaper-based color palette'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cae997a22c31c96bc9c1c37c857cf4757ef16c0e69d43e8761b84d9c95ff2ed6')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
