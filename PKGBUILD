pkgname=hyprhalt
pkgver=0.1.3
pkgrel=1
pkgdesc="Python-based session exit tool for Hyprland built with Quickshell"
arch=('any')
url="https://github.com/knownasnaffy/hyprhalt"
license=('Unlicense')
depends=('quickshell')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('93d1fb0cc0ffc1d0cfa912660e9a9e41b82d540c442c9b65126ac6fab15a5b5a')

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
