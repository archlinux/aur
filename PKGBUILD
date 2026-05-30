# Maintainer: mryll <https://github.com/mryll>
pkgname=claudebar
pkgver=0.3.0
pkgrel=1
pkgdesc='Waybar widget displaying Claude AI subscription usage with colored progress bars'
arch=('any')
url='https://github.com/mryll/claudebar'
license=('MIT')
depends=('bash' 'waybar' 'curl' 'jq')
optdepends=('libnotify: desktop notifications on auth expiry'
            'otf-font-awesome: Claude brand icon (Font Awesome >= 7.2.0)')
conflicts=('waybar-claude-usage')
provides=('waybar-claude-usage')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/claudebar/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('82f712069e23a1b8c90c0faaf02aff48a45d97b38ac791568ddc6bb1d101508f')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
