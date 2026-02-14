pkgname=hyprhalt
pkgver=0.2.0
pkgrel=1
pkgdesc="Python-based session exit tool for Hyprland built with Quickshell"
arch=('any')
url="https://github.com/knownasnaffy/hyprhalt"
license=('Unlicense')
depends=('quickshell')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3df7d4e6a7addb35cec214363e990a673de86c9861de62f6616a348ed1598c0a')

package() {
    cd "$pkgname-$pkgver"

    # daemon + ui assets
    install -d "$pkgdir/usr/share/hyprhalt"
    cp -r daemon ui "$pkgdir/usr/share/hyprhalt/"

    # wrapper script
    install -Dm755 hyprhalt "$pkgdir/usr/bin/hyprhalt"

    # license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
