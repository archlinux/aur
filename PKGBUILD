# Maintainer: mryll <https://github.com/mryll>
pkgname=claudebar
pkgver=0.10.6
pkgrel=1
pkgdesc='Waybar widget displaying Claude AI subscription usage with colored progress bars'
arch=('any')
url='https://github.com/mryll/claudebar'
license=('MIT')
depends=('bash' 'waybar' 'curl' 'jq')
optdepends=('libnotify: desktop notifications on auth expiry'
            'otf-font-awesome: Claude brand icon (Font Awesome >= 7.2.0)'
            'ttf-jetbrains-mono-nerd: monospace font the tooltip pins by default (--tooltip-font)')
conflicts=('waybar-claude-usage')
provides=('waybar-claude-usage')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/claudebar/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4972f13f81103ca5ce23c6b06fcc65a7421a58f20b550e0207454b4e0ba348ec')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
