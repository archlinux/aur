# Maintainer: mryll <https://github.com/mryll>
pkgname=waybar-claude-usage
pkgver=0.1.1
pkgrel=1
pkgdesc='Waybar widget displaying Claude AI subscription usage with colored progress bars'
arch=('any')
url='https://github.com/mryll/waybar-claude-usage'
license=('MIT')
depends=('bash' 'waybar' 'curl' 'jq')
optdepends=('libnotify: desktop notifications on auth expiry')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/waybar-claude-usage/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a01dcfbf02aa2929d07a049764aa379d6b0209c60c3b6c2c3fad68265435c246')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
