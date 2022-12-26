# Maintainer: TobFromme

# https://github.com/DSheirer/sdrtrunk/releases/download/v0.5.0/sdr-trunk-linux-x86_64-v0.5.0.zip
# https://github.com/DSheirer/sdrtrunk/releases/download/v0.5.0/sdr-trunk-linux-aarch64-v0.5.0.zip

pkgname=sdrtrunk-git
pkgver=0.5.0
pkgrel=10
pkgdesc="A cross-platform java application for decoding, monitoring, recording and streaming trunked mobile and related radio protocols using SDR"
arch=('aarch64' 'x86_64')
url="https://github.com/DSheirer/sdrtrunk"
license=('GPL3')
groups=()
depends=('java-runtime' 'at-spi2-core' 'libnet' 'alsa-lib' 'gtk3')
checkdepends=()
optdepends=()
provides=('sdrtrunk-git')
conflicts=('sdrtrunk-git' 'sdrtrunk-bin' 'sdrtrunk')
replaces=()
backup=()
options=()
install=
changelog=

source_aarch64=("https://github.com/DSheirer/sdrtrunk/releases/download/v${pkgver}/sdr-trunk-linux-aarch64-v${pkgver}.zip"
                "cat-radio-icon.png"
                "sdrtrunk.desktop")

source_x86_64=("https://github.com/DSheirer/sdrtrunk/releases/download/v${pkgver}/sdr-trunk-linux-x86_64-v${pkgver}.zip"
               "cat-radio-icon.png"
               "sdrtrunk.desktop")

sha256sums_aarch64=('e967864302540f9087090604d81c64a1eac1f9de1f0c453d2a661ecb49dce717'
                    '9cfe31c8bd4043891cf59aa76b33f30ed9b9f4403a386e5bf57f32226f3f2b26'
                    'ea344583a65800239959917ef8849c725975ea05b571cbd74133b20b8c71f46d')
sha256sums_x86_64=('5e5d63499afb3a7a1173c9a248b1d85b34de983297c58c89961ca7c076fdeb82'
                   '9cfe31c8bd4043891cf59aa76b33f30ed9b9f4403a386e5bf57f32226f3f2b26'
                   'ea344583a65800239959917ef8849c725975ea05b571cbd74133b20b8c71f46d')


package() {
  install -Dm644 ../cat-radio-icon.png "${pkgdir}/usr/share/pixmaps/cat-radio-icon.png"
  install -Dm644 ../sdrtrunk.desktop   "${pkgdir}/usr/share/applications/sdrtrunk.desktop"
  
  cd "sdr-trunk-linux-${CARCH}-v${_pkgsubver}"
  mkdir -p "${pkgdir}/opt/sdrtrunk"
  cp -ra * "${pkgdir}/opt/sdrtrunk"
}
