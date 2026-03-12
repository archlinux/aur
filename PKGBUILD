# Maintainer: Toby Heath <heath-toby on GitHub>
pkgname=wl-screen-curtain
pkgver=1.0.0
pkgrel=1
pkgdesc='Screen curtain for Wayland — blanks all displays with a black overlay for accessibility'
arch=('any')
url='https://github.com/heath-toby/wl-screen-curtain'
license=('MIT')
depends=('python' 'python-gobject' 'gtk-layer-shell')
optdepends=(
    'orca: speech announcements via Orca screen reader'
    'speech-dispatcher: speech announcements via spd-say fallback'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cd71ab4b379f68248cb44997da283f6b0d93deb68e147a8d96af8bd3e97edf6f')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 screen-curtain-overlay "$pkgdir/usr/bin/screen-curtain-overlay"
    install -Dm755 screen-curtain "$pkgdir/usr/bin/screen-curtain"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
