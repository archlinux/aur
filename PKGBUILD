# Maintainer: CarlosEvCode <programer.cm12@gmail.com>

pkgname=tui-game-station-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Sleek terminal-based gaming launcher and emulator dashboard (Pre-compiled)"
arch=('x86_64')
url="https://github.com/CarlosEvCode/tui_game_station"
license=('MIT')
depends=('openssl' 'sqlite')
provides=('tui-game-station')
conflicts=('tui-game-station')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/CarlosEvCode/tui_game_station/releases/download/v${pkgver}/tui_game_station-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums=('dd34c48231503ecc9631012093a3ece3a381ce9a743c8e0c773dfb62dc0eb592')

package() {
  # Install binary to /usr/bin/tui-game-station
  install -Dm755 "$srcdir/tui_game_station-v${pkgver}-x86_64-unknown-linux-gnu/tui-game-station" "$pkgdir/usr/bin/tui-game-station"

  # Install documentation and license
  install -Dm644 "$srcdir/tui_game_station-v${pkgver}-x86_64-unknown-linux-gnu/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/tui_game_station-v${pkgver}-x86_64-unknown-linux-gnu/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
