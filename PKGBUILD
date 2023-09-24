# Maintainer: Henry-ZHR <henry-zhr@qq.com>
_pkgname=musicplayer2
pkgname=${_pkgname}-bin
pkgver=V2.76.1
pkgrel=1
pkgdesc='An audio player which supports music collection playback, lyrics display, format conversion and many other functions'
arch=('i686' 'x86_64')
url='https://github.com/zhongyang219/MusicPlayer2'
license=('GPL3')
depends=(bash wine winetricks)
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(global_cfg.ini musicplayer2.sh musicplayer2.desktop)
source_i686=("${url}/releases/download/${pkgver}/MusicPlayer2_${pkgver}_x86.zip")
source_x86_64=("${url}/releases/download/${pkgver}/MusicPlayer2_${pkgver}_x64.zip")
sha512sums=(SKIP SKIP SKIP)
sha512sums_i686=('71d3c83dc8babad4d3cf228cd4f437054a76729ead312667ce0df6d5b096b3fc4b8c978ca72a4e991a314043001c003b653edc35169487d6fb5c70f868631b0f')
sha512sums_x86_64=('fdbe03f447034c3cf0bcfb2e5cec80d8ae3b3583b8b7f6d449b4e7dc2ccc12658d2b27b3ebc03611ad047e00b4cf8f123b957b0495ee913a5a4898524883addd')

package() {
  install -d "${pkgdir}/usr/share/${_pkgname}"
  cp -r MusicPlayer2*/. "${pkgdir}/usr/share/${_pkgname}"
  install -m644 global_cfg.ini "${pkgdir}/usr/share/${_pkgname}"

  install -Dm755 musicplayer2.sh "${pkgdir}/usr/bin/musicplayer2"
  install -Dm644 musicplayer2.desktop "${pkgdir}/usr/share/applications/musicplayer2.desktop"
  install -Dm644 MusicPlayer2*/Logo/MusicPlayer2.150x150Logo.png "${pkgdir}/usr/share/pixmaps/musicplayer2.png"
}
