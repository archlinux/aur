# Maintainer: mryll <https://github.com/mryll>
pkgname=waybar-codex-usage
pkgver=0.1.0
pkgrel=1
pkgdesc='Waybar widget displaying OpenAI Codex subscription usage with colored progress bars'
arch=('any')
url='https://github.com/mryll/waybar-codex-usage'
license=('MIT')
depends=('bash' 'waybar' 'curl' 'jq')
optdepends=('libnotify: desktop notifications on session expiry')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/waybar-codex-usage/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c4694244e82a601eb5b9a0b506457ec69826e92646c244201560170424ee2a7')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
