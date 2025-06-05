# Maintainer: Philip J. Repko <philipjrepko@gmail.com>
pkgname=sqlch-suite
pkgver=0.1.1
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
source=("https://github.com/SW-philip/sqlch-suite/releases/download/v0.1.1/sqlch-suite-0.1.1.tar.gz")
sha256sums=('75ddc71a4c257fcd0e3f3129a08a135285535ab09c4631f1202645863a721124')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install binaries
  install -Dm755 "$srcdir/sqlch-suite-${pkgver}/bin/sqlchctl" "$pkgdir/usr/bin/sqlchctl"
  install -Dm755 "$srcdir/sqlch-suite-${pkgver}/bin/sqlchknob" "$pkgdir/usr/bin/sqlchknob"
  install -Dm755 "$srcdir/sqlch-suite-${pkgver}/bin/sqlchtray" "$pkgdir/usr/bin/sqlchtray"

  # Install icons
  install -Dm644 assets/sqlchtray-icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/sqlch.png"

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
