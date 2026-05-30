# Maintainer: d10n <david at bitinvert dot com>

pkgname=mullvad-tui-bin
pkgver=0.9.1
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
sha256sums=('d5219e1a02a391d3abb94612a3b712001dd0bb59377dac1c81c589d12e432caa')

package() {
  cd "$srcdir/mullvad-tui-$pkgver-x86_64-unknown-linux-gnu"
  install -Dm0755 mullvad-tui "$pkgdir/usr/bin/mullvad-tui"
  install -Dm0644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm0644 AUTHORS -t "$pkgdir/usr/share/doc/$pkgname/"
}

