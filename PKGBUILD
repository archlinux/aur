# Maintainer: AmetistYT <ametist0yt@gmail.com>
pkgname=soundpaad-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Sound pad with virtual microphone support for Linux"
arch=('x86_64')
url="https://github.com/AmetistYT/soundpaad"
license=('MIT')
depends=('gtk4' 'libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'pipewire-pulse' 'openssl')
optdepends=('pulseaudio: PulseAudio server (alternative to PipeWire)')
provides=('soundpaad')
conflicts=('soundpaad')
source=("soundpaad-${pkgver}::https://github.com/AmetistYT/soundpaad/releases/download/v${pkgver}/soundpaad"
        "com.soundpaad.app.desktop"
        "com.soundpaad.app.svg")
sha256sums=('f7dcb2f4ec746582700c18f5a1dbd95c06f3a2f348eb5cb1e35ec7d406e8c9d2'
            '8359701edad14fde483728eb275dee9b7c8052e4b9a4d470af150b805dec1926'
            '711a600b092364e9b787243d9c234b9e44582cba7a6261b79f305a0323e08785')

package() {
    install -Dm755 "soundpaad-${pkgver}" "${pkgdir}/usr/bin/soundpaad"
    install -Dm644 "com.soundpaad.app.desktop" "${pkgdir}/usr/share/applications/com.soundpaad.app.desktop"
    install -Dm644 "com.soundpaad.app.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.soundpaad.app.svg"
}
