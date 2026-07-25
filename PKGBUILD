pkgname=niri-pimg
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight screenshot pin and annotation tool for niri"
arch=('any')
url="https://github.com/CokeAsh/niri-pimg"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'python-cairo' 'wl-clipboard' 'niri')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('23ed492d65db1a32a2ed2a174f6862375bc4fa559eb002abda0690cfaaa83a11')

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 niri-pimg "$pkgdir/usr/bin/niri-pimg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 niri/integration.kdl \
        "$pkgdir/usr/share/doc/$pkgname/integration.kdl"
}
