# Maintainer: TobFromme

pkgname=sdrtrunk-git
pkgver=0.5.0
pkgrel=7
_pkgdldir=${pkgver}-beta.${pkgrel}
_pkgsubver=${pkgver}-beta${pkgrel}
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

source_aarch64=("https://github.com/DSheirer/sdrtrunk/releases/download/v${_pkgdldir}/sdr-trunk-linux-aarch64-v${_pkgsubver}.zip"
                "cat-radio-icon.png"
                "sdrtrunk.desktop")

source_x86_64=("https://github.com/DSheirer/sdrtrunk/releases/download/v${_pkgdldir}/sdr-trunk-linux-x86_64-v${_pkgsubver}.zip"
               "cat-radio-icon.png"
               "sdrtrunk.desktop")

sha256sums_aarch64=('f957ba1412ee7b77a533715bae7dc7e4224b9dab737f3cc2792f77a7c041ed4a'
                    '9cfe31c8bd4043891cf59aa76b33f30ed9b9f4403a386e5bf57f32226f3f2b26'
                    'ea344583a65800239959917ef8849c725975ea05b571cbd74133b20b8c71f46d')

sha256sums_x86_64=('0dd4167f2c6578e6b291dfbe468e797a3eda0cc9395611957a88fa4aa1c93bc5'
                   '9cfe31c8bd4043891cf59aa76b33f30ed9b9f4403a386e5bf57f32226f3f2b26'
                   'ea344583a65800239959917ef8849c725975ea05b571cbd74133b20b8c71f46d')

package() {
  install -Dm644 ../cat-radio-icon.png "${pkgdir}/usr/share/pixmaps/cat-radio-icon.png"
  install -Dm644 ../sdrtrunk.desktop   "${pkgdir}/usr/share/applications/sdrtrunk.desktop"
  
  cd "sdr-trunk-linux-${CARCH}-v${_pkgsubver}"
  mkdir -p "${pkgdir}/opt/sdrtrunk"
  cp -ra * "${pkgdir}/opt/sdrtrunk"
}
