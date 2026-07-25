pkgname=niri-pimg
pkgver=0.1.1
pkgrel=1
pkgdesc="Lightweight screenshot pin and annotation tool for niri"
arch=('any')
url="https://github.com/CokeAsh/niri-pimg"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'python-cairo' 'wl-clipboard' 'niri')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('92c2b72e78353c3d0fbbfecb4466038520777882a54ac5c620639cf67b21675e')

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 niri-pimg "$pkgdir/usr/bin/niri-pimg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 niri/integration.kdl \
        "$pkgdir/usr/share/doc/$pkgname/integration.kdl"
}
