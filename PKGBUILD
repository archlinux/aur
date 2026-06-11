# Maintainer: mryll <https://github.com/mryll>
pkgname=codexbar
pkgver=0.6.0
pkgrel=1
pkgdesc='Waybar widget displaying OpenAI Codex subscription usage with colored progress bars'
arch=('any')
url='https://github.com/mryll/codexbar'
license=('MIT')
depends=('bash' 'waybar' 'curl' 'jq')
optdepends=('libnotify: desktop notifications on session expiry'
            'otf-font-awesome: OpenAI brand icon (Font Awesome >= 7.0.0)'
            'ttf-jetbrains-mono-nerd: default font for the framed tooltip (--frame / --frame-font)')
conflicts=('waybar-codex-usage')
provides=('waybar-codex-usage')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/codexbar/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3d1ff2009c550f73fefbb28f89a04b0f8c4c8a83a64e8ec4815bca04a0e761ac')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
