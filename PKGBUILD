# Maintainer: Philip J. Repko <philipjrepko@gmail.com>
pkgname=sqlch-suite
pkgver=1.0
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/SW-philip/sqlch-suite/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('70a73bd050797a155a1ac93b0407d6cdfff8bd1faef171bd4e4cc10aba9d6e82')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  install -Dm755 sqlchctl "$pkgdir/usr/bin/sqlchctl"
  install -Dm755 sqlchtray "$pkgdir/usr/bin/sqlchtray"
  install -Dm755 sqlchknob "$pkgdir/usr/bin/sqlchknob"
}
