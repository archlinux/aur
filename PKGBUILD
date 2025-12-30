# Maintainer: bnema <b at bnema dot dev>
pkgname=dumber-browser-bin
pkgver=0.23.1
pkgrel=1
pkgdesc="A minimal keyboard-driven browser for tiling WMs"
arch=('x86_64')
url="https://github.com/bnema/dumber"
license=('MIT')
depends=('gtk4' 'webkitgtk-6.0')
optdepends=(
    'gstreamer: Media playback support'
    'gst-plugins-base: Base media codecs'
    'gst-plugins-good: Additional media codecs'
    'gst-plugins-bad: Extended media codecs'
    'gst-libav: FFmpeg-based codecs'
)
provides=('dumber-browser' 'dumber')
conflicts=('dumber-browser' 'dumber-browser-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bnema/dumber/releases/download/v${pkgver}/dumber_linux_x86_64.tar.gz"
        "dev.bnema.Dumber.desktop::https://raw.githubusercontent.com/bnema/dumber/v${pkgver}/dev.bnema.Dumber.desktop"
        "logo-512.png::https://raw.githubusercontent.com/bnema/dumber/v${pkgver}/assets/logo-512.png"
        "LICENSE::https://raw.githubusercontent.com/bnema/dumber/v${pkgver}/LICENSE")
sha256sums=('c8230e3a5258333fed401439b08c6ef7b0681dd14f4e97a7e837dfc2c4cc83a0'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    cd "dumber_${pkgver}"
    install -Dm755 dumber "${pkgdir}/usr/bin/dumber"
    install -Dm644 "${srcdir}/dev.bnema.Dumber.desktop" "${pkgdir}/usr/share/applications/dev.bnema.Dumber.desktop"
    install -Dm644 "${srcdir}/logo-512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/dev.bnema.Dumber.png"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
