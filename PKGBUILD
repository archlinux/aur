# Maintainer: MHIA (MHashir09)
# Github-Profile: https://www.github.com/Mhashir09
# Codeberg-Profile: https://codeberg.org/MHIA

pkgname=rofi-webapps-manager
pkgver=0.5.1
pkgrel=1
pkgdesc="A rofi-based web app manager for Chromium-based browsers"
arch=('any')
url="https://codeberg.org/MHIA/Rofi-WebApps-Manager"
license=('GPL3')
install=webapp-manager.install
depends=(
    'curl'
    'dunst'
    'bash'
    'rofi'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "webapp-manager.install")
sha256sums=('7ddf6312bd4b0064fe9fd6f41eff39ada7985ad83367edbd64bbcb7f8639c5b4'
            '0adff0c8c7bab4573329aab012c1cbcca5b9445b2454444f279180fddcedf4b2')

package() {
    cd "$srcdir/rofi-webapps-manager"
    install -Dm755 webapp-manager.sh "$pkgdir/usr/bin/webapp-manager"
    install -Dm644 webapp-manager.desktop "$pkgdir/usr/share/applications/webapp-manager.desktop"
    install -Dm644 icons/webapp-manager.png "$pkgdir/usr/share/icons/webapp-manager.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
