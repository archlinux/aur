# Maintainer: MHIA (MHashir09)
# Github-Profile: https://www.github.com/Mhashir09
# Codeberg-Profile: https://codeberg.org/MHIA

pkgname=rofi-webapps-manager
pkgver=0.5.0
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
sha256sums=('7c50564cfc539acccd8f51b217a515b221cfa52681d61cd86f18bf559e6b9320'
            '0adff0c8c7bab4573329aab012c1cbcca5b9445b2454444f279180fddcedf4b2')

_reponame="Rofi-WebApps-Manager"

package() {
    cd "$srcdir/$_reponame-$pkgver"
    install -Dm755 webapp-manager.sh "$pkgdir/usr/bin/webapp-manager"
    install -Dm644 webapp-manager.desktop "$pkgdir/usr/share/applications/webapp-manager.desktop"
    install -Dm644 icons/webapp-manager.png "$pkgdir/usr/share/icons/webapp-manager.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
