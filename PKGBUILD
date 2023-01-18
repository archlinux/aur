# Maintainer: TobFromme

pkgname=sdrtrunk-git
pkgver=0.5.1_beta1
pkgrel=2
_pkgverdl=0.5.1-beta1
pkgdesc="A cross-platform java application for decoding, monitoring, recording and streaming trunked mobile and related radio protocols using SDR"
arch=('aarch64' 'x86_64')
url="https://github.com/DSheirer/sdrtrunk"
license=('GPL3')
depends=('at-spi2-core' 'libnet' 'alsa-lib' 'gtk3')
provides=('sdrtrunk-git')
conflicts=('sdrtrunk-git' 'sdrtrunk-bin' 'sdrtrunk')

source_aarch64=("https://github.com/DSheirer/sdrtrunk/releases/download/v${_pkgverdl}/sdr-trunk-linux-aarch64-v${_pkgverdl}.zip"
                "cat-radio-icon.png"
                "sdrtrunk.desktop")

source_x86_64=("https://github.com/DSheirer/sdrtrunk/releases/download/v${_pkgverdl}/sdr-trunk-linux-x86_64-v${_pkgverdl}.zip"
               "cat-radio-icon.png"
               "sdrtrunk.desktop")

sha256sums_aarch64=('29f3ca7776efb5317fa935cc3211137b4c30602abf2cd43e9e1854de173e20c8'
                    '9cfe31c8bd4043891cf59aa76b33f30ed9b9f4403a386e5bf57f32226f3f2b26'
                    'b07918f6523621b34b90fc34b275cdb13bef7689608e584f2f7109c84cb42919')
sha256sums_x86_64=('964136fd815e5298a0b06bedf1a0182b897fa0bf2d2429c7bc6e5ce5a8b4b743'
                   '9cfe31c8bd4043891cf59aa76b33f30ed9b9f4403a386e5bf57f32226f3f2b26'
                   'b07918f6523621b34b90fc34b275cdb13bef7689608e584f2f7109c84cb42919')

package() {
  install -Dm644 ../cat-radio-icon.png "${pkgdir}/usr/share/pixmaps/cat-radio-icon.png"
  install -Dm644 ../sdrtrunk.desktop   "${pkgdir}/usr/share/applications/sdrtrunk.desktop"
  
  cd "sdr-trunk-linux-${CARCH}-v${_pkgverdl}"
  mkdir -p "${pkgdir}/opt/sdrtrunk"
  cp -ra * "${pkgdir}/opt/sdrtrunk"
}
