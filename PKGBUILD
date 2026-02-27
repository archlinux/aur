# Maintainer: mryll <https://github.com/mryll>
pkgname=waybar-codex-usage
pkgver=0.1.3
pkgrel=1
pkgdesc='Waybar widget displaying OpenAI Codex subscription usage with colored progress bars'
arch=('any')
url='https://github.com/mryll/waybar-codex-usage'
license=('MIT')
depends=('bash' 'waybar' 'curl' 'jq')
optdepends=('libnotify: desktop notifications on session expiry')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/waybar-codex-usage/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d10bce442ce6906082603672516ce66b47cae2b1b34f1fc3d85b9a683c44d91b')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
