# Maintainer: AmetistYT <ametist0yt@gmail.com>
pkgname=soundpaaad-bin
pkgver=0.1.1
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
sha256sums=('1f2dc8fd713308e60f36e9b955ab968aa8f912ab9e9166314524f2327ee4f6fb'
            '8359701edad14fde483728eb275dee9b7c8052e4b9a4d470af150b805dec1926'
            '711a600b092364e9b787243d9c234b9e44582cba7a6261b79f305a0323e08785')

package() {
    install -Dm755 "soundpaad-${pkgver}" "${pkgdir}/usr/bin/soundpaad"
    install -Dm644 "com.soundpaad.app.desktop" "${pkgdir}/usr/share/applications/com.soundpaad.app.desktop"
    install -Dm644 "com.soundpaad.app.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.soundpaad.app.svg"
}
