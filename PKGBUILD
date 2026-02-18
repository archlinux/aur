pkgname=hyprhalt
pkgver=0.2.1
pkgrel=1
pkgdesc="Python-based session exit tool for Hyprland built with Quickshell"
arch=('any')
url="https://github.com/knownasnaffy/hyprhalt"
license=('Unlicense')
depends=('quickshell')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9fc9aa9c5346af45081e948965a936e554d50791671832ee5695cd49245159af')

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
