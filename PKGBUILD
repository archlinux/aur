# Maintainer: mryll <https://github.com/mryll>
pkgname=waybar-codex-usage
pkgver=0.0.1
pkgrel=2
pkgdesc='Waybar widget displaying OpenAI Codex subscription usage with colored progress bars'
arch=('any')
url='https://github.com/mryll/waybar-codex-usage'
license=('MIT')
depends=('bash' 'waybar' 'curl' 'jq')
optdepends=('libnotify: desktop notifications on session expiry')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/waybar-codex-usage/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3422afef4486f4229dbee04d9216f44dfe0a233d1ba04823d2ce4c983a8c8bc1')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
