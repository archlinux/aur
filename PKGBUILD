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
sha256sums_x86_64=('434c6f6d4487d7adc978e7c66b0c4c44aee861e4469b10682b56bb51734e0aef')
sha256sums_aarch64=('7a4e01ea3f0abf24f1dc8fe1733df2539def98e388132991d11f1518007249ce')

package() {
  install -Dm755 whis "${pkgdir}/usr/bin/whis"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
