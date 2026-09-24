# Maintainer: mc_klatz
pkgname=sone-bin
pkgver=0.22.1
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
source=("$pkgname-$pkgver.pkg.tar.zst::https://github.com/lullabyX/sone/releases/download/v${pkgver}/sone-x86_64.pkg.tar.zst")
sha256sums=('c0b05cdab7ff657d9abf908a5db85ecfc7262b1729eac04899ec187571c941e1')

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
