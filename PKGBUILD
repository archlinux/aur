# Maintainer: mryll <https://github.com/mryll>
pkgname=codexbar
pkgver=0.1.12
pkgrel=1
pkgdesc='Waybar widget displaying OpenAI Codex subscription usage with colored progress bars'
arch=('any')
url='https://github.com/mryll/codexbar'
license=('MIT')
depends=('bash' 'waybar' 'curl' 'jq')
optdepends=('libnotify: desktop notifications on session expiry'
            'otf-font-awesome: OpenAI brand icon (Font Awesome >= 7.0.0)')
conflicts=('waybar-codex-usage')
provides=('waybar-codex-usage')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/codexbar/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e7a97b116ce2ab3bef87a652b2bc8dcd8351f3723666ede05c2a0d1e14f7643e')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
