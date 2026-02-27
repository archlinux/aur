# Maintainer: mryll <https://github.com/mryll>
pkgname=waybar-codex-usage
pkgver=0.1.2
pkgrel=1
pkgdesc='Waybar widget displaying OpenAI Codex subscription usage with colored progress bars'
arch=('any')
url='https://github.com/mryll/waybar-codex-usage'
license=('MIT')
depends=('bash' 'waybar' 'curl' 'jq')
optdepends=('libnotify: desktop notifications on session expiry')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/waybar-codex-usage/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('43ff0557dca413196fe938a2730b53fd39e7f35cd4dc126a7405e9c15b7856c8')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
