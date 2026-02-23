# Maintainer: MHIA (MHashir09)
# Github: https://www.github.com/Mhashir09

pkgname=rofi-webapps-manager
pkgver=0.1.0
pkgrel=1
pkgdesc="A rofi-based web app manager for Chromium-based browsers"
arch=('any')
url="https://github.com/MHashir09/Rofi-WebApps-Manager"
license=('MIT')
install=webapp-manager.install
depends=(
    'curl'
    'dunst'
    'bash'
    'rofi-wayland'
)
optdepends=(
    'rofi: X11 alternative to rofi-wayland'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "webapp-manager.install")
sha256sums=('SKIP'
            'SKIP')

_reponame="Rofi-WebApps-Manager"

package() {
    cd "$srcdir/$_reponame-$pkgver"
    install -Dm755 webapp-manager.sh "$pkgdir/usr/bin/webapp-manager"
    install -Dm644 webapp-manager.desktop "$pkgdir/usr/share/applications/webapp-manager.desktop"
    install -Dm644 icons/webapp-manager.png "$pkgdir/usr/share/icons/webapp-manager.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
