# Maintainer: mryll <https://github.com/mryll>
pkgname=waybar-codex-usage
pkgver=0.1.1
pkgrel=1
pkgdesc='Waybar widget displaying OpenAI Codex subscription usage with colored progress bars'
arch=('any')
url='https://github.com/mryll/waybar-codex-usage'
license=('MIT')
depends=('bash' 'waybar' 'curl' 'jq')
optdepends=('libnotify: desktop notifications on session expiry')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/waybar-codex-usage/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3921605f9ffaca86bde870ae4cb8dc480aca288857a6477fd834ecea59f88955')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
