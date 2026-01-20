# Maintainer: Frank Dierolf <frank_dierolf@web.de>
pkgname=whis-cli-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="Voice-to-text CLI for terminal users"
arch=('x86_64' 'aarch64')
url="https://github.com/frankdierolf/whis"
license=('MIT')
provides=('whis-cli' 'whis')
conflicts=('whis-cli' 'whis')
depends=('alsa-lib' 'gcc-libs' 'glibc')
optdepends=(
  'libpulse: PulseAudio device enumeration'
  'vulkan-icd-loader: Local transcription with GPU acceleration'
)
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/frankdierolf/whis/releases/download/v${pkgver}/whis-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://github.com/frankdierolf/whis/releases/download/v${pkgver}/whis-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('fdc3484ae77a2fcff0ca64af3ee31f03e3630a4b4ae5a75c9ae6616ac75902cc')
sha256sums_aarch64=('78a1e4e0d59e84bb19d8607fd162fcfbce6a1ce663c7e635de8d1d7328de85c1')

package() {
  install -Dm755 whis "${pkgdir}/usr/bin/whis"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
