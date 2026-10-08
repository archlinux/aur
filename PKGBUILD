# Maintainer: Aneesh Sambu (https://github.com/sambuaneesh)
pkgname=playy-bin
_pkgname=playy
pkgver=0.1.0
pkgrel=1
pkgdesc='Music player for the terminal: your music folder and YouTube Music in one library, offline or online (prebuilt)'
arch=('x86_64')
url='https://github.com/sambuaneesh/playy'
license=('MIT')
depends=('mpv' 'yt-dlp' 'ffmpeg')
optdepends=('kitty: sharp cover art (other terminals show block art)'
            'libnotify: a notification when a song starts'
            'wl-clipboard: copy links and open shared links from the clipboard (Wayland)'
            'xdg-utils: open links in the browser')
provides=('playy')
conflicts=('playy')
options=('!debug' '!strip')
source=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('a1e2370aaae7bccffe7e2629a08053fc609f8b17efa33f68104d74917dc34456')

package() {
  cd "${_pkgname}-${pkgver}-linux-x86_64"
  install -Dm755 playy "${pkgdir}/usr/bin/playy"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 playy.desktop "${pkgdir}/usr/share/applications/playy.desktop"
  install -Dm644 playy.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/playy.svg"
  install -Dm644 playy-256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/playy.png"
}
