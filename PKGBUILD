# Maintainer: Philip J. Repko <you@example.com>
pkgname=sqlch-suite
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal-based internet radio suite with TUI, tray, and controller"
arch=('any')
url="https://github.com/SW-philip/sqlch-suite"
license=('MIT')
depends=('bash' 'mpv' 'gtk3' 'python' 'python-gobject' 'libayatana-appindicator' 'hicolor-icon-theme')
optdepends=(
  'gum: TUI interface in sqlchknob'
  'jq: JSON parsing for radio-browser search'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9e77b0e295b7ba9b45007a739a9d91c7e8cbe18f4cb654c61538fc5d3ebc9bf6')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install binaries
  install -Dm755 bin/sqlchctl "$pkgdir/usr/bin/sqlchctl"
  install -Dm755 bin/squelchknob "$pkgdir/usr/bin/squelchknob"
  install -Dm755 sqlchtray.py "$pkgdir/usr/bin/sqlchtray"

  # Install icons
  install -Dm644 assets/sqrrlch_icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/sqlch.png"

  # License
install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
