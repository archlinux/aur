# Maintainer: sineyed
pkgname=aethertune-bin
pkgver=0.5.1
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
sha256sums=('d16ab136d50836bfc76eb3c060c913d35142b5974e4685efe4d9a8c654258cf9')

package() {
    cd "AetherTune-v${pkgver}-linux-x86_64"
    install -Dm755 AetherTune "${pkgdir}/usr/bin/aethertune"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
