# Maintainer: mryll <https://github.com/mryll>
pkgname=waybar-claude-usage
pkgver=0.1.0
pkgrel=1
pkgdesc='Waybar widget displaying Claude AI subscription usage with colored progress bars'
arch=('any')
url='https://github.com/mryll/waybar-claude-usage'
license=('MIT')
depends=('bash' 'waybar' 'curl' 'jq')
optdepends=('libnotify: desktop notifications on auth expiry')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/waybar-claude-usage/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f7f2e393636b38305639e0031d0bba0dbe67a36b16e0091899edf9d5bcd65207')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
