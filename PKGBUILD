# Maintainer: Philip J. Repko <philipjrepko@gmail.com>
pkgname=sqlch-suite
pkgver=1.0.1
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/SW-philip/sqlch-suite/archive/refs/tags/v1.0.1.tar.gz")
sha256sums=('eab2fb4169ffcedd808e059562943321fa685f2d0f1bdb7b571591928cc6f14b')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  install -Dm755 sqlchctl "$pkgdir/usr/bin/sqlchctl"
  install -Dm755 sqlchtray "$pkgdir/usr/bin/sqlchtray"
  install -Dm755 sqlchknob "$pkgdir/usr/bin/sqlchknob"
}
