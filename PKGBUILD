# Maintainer: mryll <https://github.com/mryll>
pkgname=codexbar
pkgver=0.1.19
pkgrel=1
pkgdesc='Waybar widget displaying OpenAI Codex subscription usage with colored progress bars'
arch=('any')
url='https://github.com/mryll/codexbar'
license=('MIT')
depends=('bash' 'waybar' 'curl' 'jq')
optdepends=('libnotify: desktop notifications on session expiry'
            'otf-font-awesome: OpenAI brand icon (Font Awesome >= 7.0.0)')
conflicts=('waybar-codex-usage')
provides=('waybar-codex-usage')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/codexbar/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d76ef3740ce54e7d2e44d268687673d30df69cbf3275bab49bf2985a436b25d0')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
