# Maintainer: mryll <https://github.com/mryll>
pkgname=claudebar
pkgver=0.3.1
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
sha256sums=('e5737e2719ddb19888d7e0c857ac7ef85197cd9c922627a6481b0f75919c18a5')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
