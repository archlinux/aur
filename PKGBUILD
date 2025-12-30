# Maintainer: bnema <b at bnema dot dev>
pkgname=dumber-browser-bin
pkgver=0.23.2
pkgrel=1
pkgdesc="A minimal keyboard-driven browser for tiling WMs"
arch=('x86_64')
url="https://github.com/bnema/dumber"
license=('MIT')
depends=('gtk4' 'webkitgtk-6.0')
optdepends=(
    'gst-plugins-base: Base media codecs'
    'gst-plugins-good: Additional media codecs'
    'gst-plugins-bad: Extended media codecs'
    'gst-plugins-ugly: Patented media codecs'
    'gst-libav: FFmpeg-based codecs'
    'gst-plugin-pipewire: PipeWire audio support'
    'gst-plugin-va: Hardware video decoding (VA-API stateless decoders)'
    'pipewire: Audio/video routing'
    'pipewire-pulse: PulseAudio replacement'
    'mesa: VA-API driver for AMD GPUs'
    'libva-nvidia-driver: VA-API driver for NVIDIA GPUs'
    'libva-intel-driver: VA-API driver for older Intel GPUs'
    'intel-media-driver: VA-API driver for newer Intel GPUs (Broadwell+)'
)
provides=('dumber-browser' 'dumber')
conflicts=('dumber-browser' 'dumber-browser-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bnema/dumber/releases/download/v${pkgver}/dumber_linux_x86_64.tar.gz"
        "dev.bnema.Dumber.desktop::https://raw.githubusercontent.com/bnema/dumber/v${pkgver}/dev.bnema.Dumber.desktop"
        "logo-512.png::https://raw.githubusercontent.com/bnema/dumber/v${pkgver}/assets/logo-512.png"
        "LICENSE::https://raw.githubusercontent.com/bnema/dumber/v${pkgver}/LICENSE")
sha256sums=('ffd085d0a4204ae61ec83d9f0a060a07703b398a0e5095cae3516dfc98a43c45'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    cd "${srcdir}"
    install -Dm755 dumber "${pkgdir}/usr/bin/dumber"
    install -Dm644 "${srcdir}/dev.bnema.Dumber.desktop" "${pkgdir}/usr/share/applications/dev.bnema.Dumber.desktop"
    install -Dm644 "${srcdir}/logo-512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/dev.bnema.Dumber.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
