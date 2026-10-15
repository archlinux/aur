# Maintainer: mryll <https://github.com/mryll>
pkgname=codexbar
pkgver=0.8.5
pkgrel=1
pkgdesc='Waybar widget displaying OpenAI Codex subscription usage with colored progress bars'
arch=('any')
url='https://github.com/mryll/codexbar'
license=('MIT')
depends=('bash' 'waybar' 'curl' 'jq')
optdepends=('libnotify: desktop notifications on session expiry'
            'otf-font-awesome: OpenAI brand icon (Font Awesome >= 7.0.0)'
            'ttf-jetbrains-mono-nerd: monospace font the tooltip pins by default (--tooltip-font)')
conflicts=('waybar-codex-usage')
provides=('waybar-codex-usage')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/codexbar/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41a9c9a9a2270d34f6b2818bc2a1b6107f59d8f935c91d5471c88bb4c8de928e')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
