# Maintainer: mryll <https://github.com/mryll>
pkgname=waybar-claude-usage
pkgver=0.1.2
pkgrel=1
pkgdesc='Waybar widget displaying Claude AI subscription usage with colored progress bars'
arch=('any')
url='https://github.com/mryll/waybar-claude-usage'
license=('MIT')
depends=('bash' 'waybar' 'curl' 'jq')
optdepends=('libnotify: desktop notifications on auth expiry')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/waybar-claude-usage/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c61b4177b49927ff94b65852095510f3fe897d8a14d6e1b6e5697d7ea2247240')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
