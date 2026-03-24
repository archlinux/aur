# Maintainer: mc_klatz
pkgname=sone-bin
pkgver=0.14.1
pkgrel=1
pkgdesc="Native Linux TIDAL client — lossless streaming with bit-perfect ALSA output up to 24-bit/192kHz"
arch=('x86_64')
url="https://github.com/lullabyX/sone"
license=('GPL-3.0-only')
provides=('sone')
conflicts=('sone')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libayatana-appindicator'
    'openssl'
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
    'gst-plugins-bad'
    'gst-libav'
    'libsecret'
)
optdepends=(
    'gst-plugin-pipewire: PipeWire audio support'
    'alsa-plugins: exclusive ALSA output (bit-perfect mode)'
)
source=("$pkgname-$pkgver.pkg.tar.zst::https://github.com/lullabyX/sone/releases/download/v${pkgver}/sone-${pkgver}-x86_64.pkg.tar.zst")
sha256sums=('066e9d6d8e5a4331d36da69c4b522479171da8866a1ee2b409aa3317a14ee05f')

package() {
    cd "$srcdir"

    install -Dm755 usr/bin/sone \
        "$pkgdir/usr/bin/sone"

    install -Dm644 usr/share/applications/SONE.desktop \
        "$pkgdir/usr/share/applications/SONE.desktop"

    for size in 32x32 64x64 128x128 256x256@2; do
        install -Dm644 "usr/share/icons/hicolor/${size}/apps/sone.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}/apps/sone.png"
    done
}
