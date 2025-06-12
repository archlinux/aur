# Maintainer: Philip J. Repko <philipjrepko@gmail.com>
pkgname=sqlch-suite
pkgver=1.1
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/SW-philip/sqlch-suite/archive/refs/tags/v1.1.tar.gz")
sha256sums=('dbc618abb068819252bd736f86c6e0543fa1f4c635bd4bfc723aad9e0175f969')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  install -Dm755 sqlchctl "$pkgdir/usr/bin/sqlchctl"
  install -Dm755 sqlchtray "$pkgdir/usr/bin/sqlchtray"
  install -Dm755 sqlchknob "$pkgdir/usr/bin/sqlchknob"
}
