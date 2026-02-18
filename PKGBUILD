# Maintainer: mryll <https://github.com/mryll>
pkgname=waybar-claude-usage
pkgver=0.0.1
pkgrel=2
pkgdesc='Waybar widget displaying Claude AI subscription usage with colored progress bars'
arch=('any')
url='https://github.com/mryll/waybar-claude-usage'
license=('MIT')
depends=('bash' 'waybar' 'curl' 'jq')
optdepends=('libnotify: desktop notifications on auth expiry')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/waybar-claude-usage/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7cac945c5e7458d6624718ffe149e17e177d2141bcd4bfe7fef41066f1469627')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
