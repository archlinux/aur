# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=sdrtrunk-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A cross-platform java application for decoding, monitoring, recording and streaming trunked mobile and related radio protocols using SDR"
arch=('i686' 'x86_64')
url="https://github.com/DSheirer/sdrtrunk"
license=('GPLv3')
depends=('jre-openjdk' 'java-openjfx')
provides=("sdrtrunk=${pkgver}")
conflicts=('sdrtrunk')
source=("https://github.com/DSheirer/sdrtrunk/releases/download/v${pkgver}/sdr-trunk-linux-${CARCH}-v${pkgver}.zip"
	"sdrtrunk.desktop" "cat-radio-icon.png")
sha256sums=('5e5d63499afb3a7a1173c9a248b1d85b34de983297c58c89961ca7c076fdeb82'
            'ea344583a65800239959917ef8849c725975ea05b571cbd74133b20b8c71f46d'
            '9cfe31c8bd4043891cf59aa76b33f30ed9b9f4403a386e5bf57f32226f3f2b26')

package() {
  install -Dm644 cat-radio-icon.png "${pkgdir}/usr/share/pixmaps/cat-radio-icon.png"
  install -Dm644 sdrtrunk.desktop   "${pkgdir}/usr/share/applications/sdrtrunk.desktop"
  
  cd "sdr-trunk-linux-${CARCH}-v${pkgver}"
  mkdir -p "${pkgdir}/opt/sdrtrunk"
  cp -ra * "${pkgdir}/opt/sdrtrunk"
}
