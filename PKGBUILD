# Maintainer: Frank Dierolf <frank_dierolf@web.de>
pkgname=whis-cli-bin
pkgver=0.7.1
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
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/frankdierolf/whis/releases/download/v${pkgver}/whis-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://github.com/frankdierolf/whis/releases/download/v${pkgver}/whis-cli-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')  # Replace with actual checksum
sha256sums_aarch64=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5') # Replace with actual checksum

package() {
  install -Dm755 whis "${pkgdir}/usr/bin/whis"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
