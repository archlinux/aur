# Maintainer: TobFromme

pkgname=sdrtrunk-bin
pkgver=0.5.0
pkgrel=4
pkgdesc="A cross-platform java application for decoding, monitoring, recording and streaming trunked mobile and related radio protocols using SDR"
arch=('aarch64' 'x86_64')
url="https://github.com/DSheirer/sdrtrunk"
license=('GPL3')
depends=('at-spi2-core' 'libnet' 'alsa-lib' 'gtk3')
provides=("sdrtrunk-bin")
conflicts=('sdrtrunk' 'sdrtrunk-git' 'sdrtrunk-bin')

source_aarch64=("https://github.com/DSheirer/sdrtrunk/releases/download/v${pkgver}/sdr-trunk-linux-aarch64-v${pkgver}.zip"
                "cat-radio-icon.png"
                "sdrtrunk.desktop")

source_x86_64=("https://github.com/DSheirer/sdrtrunk/releases/download/v${pkgver}/sdr-trunk-linux-x86_64-v${pkgver}.zip"
               "cat-radio-icon.png"
               "sdrtrunk.desktop")

sha256sums_aarch64=('e967864302540f9087090604d81c64a1eac1f9de1f0c453d2a661ecb49dce717'
                    '9cfe31c8bd4043891cf59aa76b33f30ed9b9f4403a386e5bf57f32226f3f2b26'
                    'b07918f6523621b34b90fc34b275cdb13bef7689608e584f2f7109c84cb42919')
sha256sums_x86_64=('5e5d63499afb3a7a1173c9a248b1d85b34de983297c58c89961ca7c076fdeb82'
                   '9cfe31c8bd4043891cf59aa76b33f30ed9b9f4403a386e5bf57f32226f3f2b26'
                   'b07918f6523621b34b90fc34b275cdb13bef7689608e584f2f7109c84cb42919')

package() {
  install -Dm644 cat-radio-icon.png "${pkgdir}/usr/share/pixmaps/cat-radio-icon.png"
  install -Dm644 sdrtrunk.desktop   "${pkgdir}/usr/share/applications/sdrtrunk.desktop"
  
  cd "sdr-trunk-linux-${CARCH}-v${pkgver}"
  mkdir -p "${pkgdir}/opt/sdrtrunk"
  cp -ra * "${pkgdir}/opt/sdrtrunk"
}
