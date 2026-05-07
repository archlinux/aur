pkgname=fuck-netease-music-git
pkgver=0.1.0.r31.ga26bfc4
pkgrel=1
pkgdesc="Rolling NetEase Cloud Music Linux port packaged from the GitHub Release AppImage"
arch=('x86_64')
url="https://github.com/fucknetease/Fuck-Netease-Music"
license=('custom')
depends=('fuse2' 'gtk3' 'nss' 'libxss')
optdepends=('xdg-utils: desktop integration helpers')
provides=('fuck-netease-music')
conflicts=('fuck-netease-music' 'fuck-netease-music-bin')
options=('!strip' '!debug')
source=(
  "https://github.com/fucknetease/Fuck-Netease-Music/releases/download/rolling-main/fuck-netease-music-x64.AppImage"
  "fuck-netease-music.sh"
  "fuck-netease-music.desktop"
  "fuck-netease-music.png"
)
noextract=('fuck-netease-music-x64.AppImage')
sha256sums=(
  'f06e8bb87f54e67937925e49d426a9fae3029497e96fe01ea166c43b6b3400d3'
  'SKIP'
  'SKIP'
  'SKIP'
)

package() {
  install -Dm755 "${srcdir}/fuck-netease-music-x64.AppImage" \
    "${pkgdir}/opt/fuck-netease-music/fuck-netease-music.AppImage"
  install -Dm755 "${srcdir}/fuck-netease-music.sh" \
    "${pkgdir}/usr/bin/fuck-netease-music"
  install -Dm644 "${srcdir}/fuck-netease-music.desktop" \
    "${pkgdir}/usr/share/applications/fuck-netease-music.desktop"
  install -Dm644 "${srcdir}/fuck-netease-music.png" \
    "${pkgdir}/usr/share/pixmaps/fuck-netease-music.png"
}
