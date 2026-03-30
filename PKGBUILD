# Maintainer: sineyed hotfixgoblin.sitcom318@passinbox.com

pkgname=aethertune-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal-based internet radio player with real-time audio visualization, built in Rust"
arch=('x86_64')
url="https://github.com/nevermore23274/AetherTune"
license=('MIT')
depends=('mpv' 'libpulse')
optdepends=('pipewire-pulse: PipeWire-based audio capture for visualizer'
            'pulseaudio: PulseAudio-based audio capture for visualizer')
provides=('aethertune')
conflicts=('aethertune' 'aethertune-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nevermore23274/AetherTune/releases/download/v${pkgver}/AetherTune-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('11d67b21eaec5d3617d7ecc7012f163f1a2105ff027b5a4989676ba4d00dd3ca')

package() {
    cd "AetherTune-v${pkgver}-linux-x86_64"

    # Install binary
    install -Dm755 AetherTune "${pkgdir}/usr/bin/aethertune"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install docs
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
