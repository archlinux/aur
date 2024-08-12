# Maintainer: Henry-ZHR <henry-zhr@qq.com>
_pkgname=musicplayer2
pkgname=${_pkgname}-bin
pkgver=2.77
pkgrel=1
pkgdesc='An audio player which supports music collection playback, lyrics display, format conversion and many other functions'
arch=('i686' 'x86_64')
url='https://github.com/zhongyang219/MusicPlayer2'
license=('GPL-3.0-only')
depends=(bash wine winetricks)
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(global_cfg.ini musicplayer2.sh musicplayer2.desktop)
source_i686=("${url}/releases/download/V${pkgver}/MusicPlayer2_V${pkgver}_x86.zip")
source_x86_64=("${url}/releases/download/V${pkgver}/MusicPlayer2_V${pkgver}_x64.zip")
sha512sums=('184756bf693775fcbaa35c70e1c4ffb23d3663fb4993163494b45a15fef8157b128d431b2755f943cffbc5bb095c5d41da13228ec79fe29ccab2a2201e7ec04b'
            '241829617c0d2fa0f0ef6e4a4e35ac8279419e1b3985a9c0d59fa2d495008c2636cca8b55c6079fe85f01a572fb2e92254a651a1e723881b99e257e7b2e0099d'
            'fb3a8d72b0786ca3ae2fbd30774417a6b2b7cc3a2108f7de3745067b9ba8caf5f7e5df589f666bae335546dd5682e3e814fb3a5c299d6e53c6cb44a1edd5351e')
sha512sums_i686=('2d0049c50f0224992b72c7f779b0f50278e301b16643e6af724c1040632e902d5c493656286cd92d20fdfd6438a0a10c552eecf7589cffd8ed94a88c0189aeeb')
sha512sums_x86_64=('2671f7f9ba854252d59727ddd734ecce2e6f70e622286156a5522518380d02195a1de521f68bb95530f8c236c9db7a373aba42cda5e0d010c7551cea93f109f5')

package() {
  install -d "${pkgdir}/usr/share/${_pkgname}"
  cp -r MusicPlayer2*/. "${pkgdir}/usr/share/${_pkgname}"
  install -m644 global_cfg.ini "${pkgdir}/usr/share/${_pkgname}"

  install -Dm755 musicplayer2.sh "${pkgdir}/usr/bin/musicplayer2"
  install -Dm644 musicplayer2.desktop "${pkgdir}/usr/share/applications/musicplayer2.desktop"
  install -Dm644 MusicPlayer2*/Logo/MusicPlayer2.150x150Logo.png "${pkgdir}/usr/share/pixmaps/musicplayer2.png"
}
