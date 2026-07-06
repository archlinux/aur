# Maintainer: vMohammad <vmohammad@vmohammad.dev>
pkgname=framr-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="A Wayland screenshot tool written in Rust (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/vMohammad24/framr"
license=('AGPL3')
provides=('framr')
conflicts=('framr')
options=('!lto')
depends=('wayland' 'libxkbcommon' 'dbus' 'cairo' 'libxcursor' 'gstreamer' 'gst-plugins-base-libs' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 'gst-plugins-bad' 'gst-plugin-rav1e' 'gst-plugin-pipewire')
source=("$pkgname-$pkgver-bin::$url/releases/download/v$pkgver/framr"
        "framr-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e89cabe3d17a4843864cb71d31f271d69c7587dc6721ecd1b13e4457881092aa'
            'c878573ee542e2795b4e07772689d91768a1c956df4f724fa5ac8f134c69e7fa')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver-bin" "$pkgdir/usr/bin/framr"

    cd "$srcdir/framr-$pkgver"
    install -Dm644 "assets/framr-handler.desktop" "$pkgdir/usr/share/applications/framr-handler.desktop"

    if [ -f "LICENSE" ]; then
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
