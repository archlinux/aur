# Maintainer: mryll <https://github.com/mryll>
pkgname=claudebar
pkgver=0.2.0
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
sha256sums=('97445b0a1f71962847c01e57f5fd7b8c0effdbbc77eb6aae1b2c3e08d18b0e8f')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
