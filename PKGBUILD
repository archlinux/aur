# Maintainer: mryll <https://github.com/mryll>
pkgname=codexbar
pkgver=0.8.4
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
sha256sums=('9d569aa371e792b383f10fd6e493dd2d6586381000eb4d7d987f3d259ec300eb')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
