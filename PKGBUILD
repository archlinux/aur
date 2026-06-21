# Maintainer: vMohammad <vmohammad@vmohammad.dev>
pkgname=framr-bin
pkgver=0.12.3
pkgrel=1
pkgdesc="A Wayland screenshot tool written in Rust (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/vMohammad24/framr"
license=('AGPL3')
provides=('framr')
conflicts=('framr')
options=('!lto')
depends=('wayland' 'libxkbcommon' 'dbus' 'cairo' 'libxcursor' 'gstreamer' 'gst-plugins-base-libs' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 'gst-plugins-bad' 'gst-plugin-rav1e')
source=("$pkgname-$pkgver-bin::$url/releases/download/v$pkgver/framr"
        "framr-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ac7bb34d3eec8f4035264a1549d498c9317ef8af4f6fa5d1ab52c09b0f9d1619'
            'c9f3498acc5f00bfd5998c0e3e60d0b89aab64777a2372c0cdda23477a6365e7')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver-bin" "$pkgdir/usr/bin/framr"

    cd "$srcdir/framr-$pkgver"
    install -Dm644 "assets/framr-handler.desktop" "$pkgdir/usr/share/applications/framr-handler.desktop"

    if [ -f "LICENSE" ]; then
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
