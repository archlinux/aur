# Maintainer: Robert Manner <the_manni at users.sf.net>

pkgname=pytranscriber-bin
pkgver=1.9
pkgrel=1
pkgdesc="UI for generating transcription (subtitles) using Google Speech Recognition (X11)"
arch=('x86_64')
url="https://github.com/raryelcostasouza/pyTranscriber"
license=('GPL')
options=(!strip !zipman)
groups=()
depends=(libgl)
optdepends=()
conflicts=(pytranscriber-wl-bin)
replaces=(pytranscriber-wl-bin)
source=("${url}/releases/download/v${pkgver}/pyTranscriber-v${pkgver}-linux-installer.zip")
sha256sums=('29f0ec7ad46b0f6328258cad8ce4ce977842f73ca2e98e3bc92b9cc37b661ded')

package()
{
  install -m 755 -D -T pyTranscriber-v${pkgver}-linux-*installer/app/pyTranscriber "${pkgdir}/usr/bin/pyTranscriber"
  install -m 644 -D -T pyTranscriber-v${pkgver}-linux-*installer/app/icon.png "${pkgdir}/usr/share/pyTranscriber/icon.png"
  mkdir -p "${pkgdir}/usr/share/applications"
  sed -e 's:/opt/pyTranscriber/pyTranscriber:/usr/bin/pyTranscriber:' \
      -e 's:/opt/pyTranscriber/icon.png:/usr/share/pyTranscriber/icon.png:' \
    pyTranscriber-v${pkgver}-linux-*installer/shortcut/pytranscriber.desktop >"${pkgdir}/usr/share/applications/pytranscriber.desktop"
}
