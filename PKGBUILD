pkgname=ripple
pkgver=1.0
pkgrel=1
pkgdesc="A simple, usable habit tracker"
arch=('x86_64')
url="https://zepyx.home.kg/ripple/"
license=('MIT')
depends=('python' 'python-gobject' 'webkit2gtk' 'gtk3')
source=('ripple.py' 'ripple.desktop' \
        '16.png' '32.png' '48.png' '64.png' '128.png' '256.png')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm755 ripple.py "$pkgdir/usr/bin/ripple"
    install -Dm644 ripple.desktop "$pkgdir/usr/share/applications/ripple.desktop"
    for size in 16 32 48 64 128 256; do
        install -Dm644 "${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/ripple.png"
    done
}
