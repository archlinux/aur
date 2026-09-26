# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=utumno
pkgver=0.1.2
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
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7a784f95abc1cc1b47140445c838b74431fd548de9ac8af6b133edd69dfaadac')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
