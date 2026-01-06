# Maintainer: bnema <b at bnema dot dev>
pkgname=dumber-browser-bin
pkgver=0.24.0
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bnema/dumber/releases/download/v${pkgver}/dumber_linux_x86_64.tar.gz")
sha256sums=('aee4449530d7efd3cb459cac790fa19d9623b185151c1181cabc7ac075352dbd')

package() {
    cd "${srcdir}/dumber_${pkgver}"
    install -Dm755 dumber "${pkgdir}/usr/bin/dumber"
    install -Dm644 dev.bnema.Dumber.desktop "${pkgdir}/usr/share/applications/dev.bnema.Dumber.desktop"
    install -Dm644 logo-512.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/dev.bnema.Dumber.png"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
