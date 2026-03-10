# Maintainer: Vasu Jain <vasujain275@gmail.com>
pkgname=coursefin-bin
pkgver=0.4.10
pkgrel=1
pkgdesc='Desktop application for managing and watching offline course content (pre-built binary)'
arch=('x86_64')
url='https://github.com/vasujain275/coursefin'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-libav')
provides=('coursefin')
conflicts=('coursefin')
source=(
    "coursefin-$pkgver::https://github.com/vasujain275/coursefin/releases/download/v$pkgver/coursefin-$pkgver-linux-amd64"
    "coursefin.desktop::https://raw.githubusercontent.com/vasujain275/coursefin/v$pkgver/packaging/coursefin.desktop"
    "coursefin.png::https://raw.githubusercontent.com/vasujain275/coursefin/v$pkgver/build/appicon.png"
    "LICENSE::https://raw.githubusercontent.com/vasujain275/coursefin/v$pkgver/LICENSE"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm755 "coursefin-$pkgver" "$pkgdir/usr/bin/coursefin"
    install -Dm644 coursefin.desktop "$pkgdir/usr/share/applications/coursefin.desktop"
    install -Dm644 coursefin.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/coursefin.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
