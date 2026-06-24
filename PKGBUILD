# Maintainer: d10n <david at bitinvert dot com>

pkgname=mullvad-tui-bin
pkgver=0.10.1
pkgrel=1
pkgdesc='Terminal user interface for mullvad-vpn'
arch=(x86_64)
url=https://github.com/d10n/mullvad-tui
license=(GPL-3.0-or-later)
provides=(mullvad-tui)
conflicts=(mullvad-tui)
depends=(mullvad-vpn)
options=(!lto !debug)
source=(
    "https://github.com/d10n/mullvad-tui/releases/download/v$pkgver/mullvad-tui-$pkgver-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums=('377b130fd0e98a235d0b767d100e3203491a606b39f58c9bab7db3548bc0a857')

package() {
  cd "$srcdir/mullvad-tui-$pkgver-x86_64-unknown-linux-gnu"
  install -Dm0755 mullvad-tui "$pkgdir/usr/bin/mullvad-tui"
  install -Dm0644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm0644 AUTHORS -t "$pkgdir/usr/share/doc/$pkgname/"
}

