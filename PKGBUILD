# Maintainer: TobFromme

pkgname=sdrtrunk-git
pkgver=0.5.0
_pkgdldir=${pkgver}-beta.6
_pkgsubver=${pkgver}-beta6
pkgrel=1
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

sha256sums_aarch64=('698f1f753d987111ad2a2f904df346c786dd50fac1d8455ccf56431278d12c14'
                    '9cfe31c8bd4043891cf59aa76b33f30ed9b9f4403a386e5bf57f32226f3f2b26'
                    'ea344583a65800239959917ef8849c725975ea05b571cbd74133b20b8c71f46d')
sha256sums_x86_64=('8662e3231598a088b1e43a1802b836343bd68b8d3b860295e0cb3d71ace19899'
                   '9cfe31c8bd4043891cf59aa76b33f30ed9b9f4403a386e5bf57f32226f3f2b26'
                   'ea344583a65800239959917ef8849c725975ea05b571cbd74133b20b8c71f46d')


package() {
  install -Dm644 ../cat-radio-icon.png "${pkgdir}/usr/share/pixmaps/cat-radio-icon.png"
  install -Dm644 ../sdrtrunk.desktop   "${pkgdir}/usr/share/applications/sdrtrunk.desktop"
  
  cd "sdr-trunk-linux-${CARCH}-v${_pkgsubver}"
  mkdir -p "${pkgdir}/opt/sdrtrunk"
  cp -ra * "${pkgdir}/opt/sdrtrunk"
}
