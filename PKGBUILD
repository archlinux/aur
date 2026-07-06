# Maintainer: Behzad Ehsani <ehsani.eof at gmail dot com>

pkgname=oryx-music-player-bin
_pkgname=oryx
pkgver=0.1.11
pkgrel=1
pkgdesc='Native Rust music player built with gpui'
arch=('x86_64')
url='https://github.com/behzade/oryx'
license=('custom:PolyForm-Strict-1.0.0')
depends=(
  'ffmpeg'
  'hicolor-icon-theme'
  'yt-dlp'
)
provides=('oryx-music-player')
conflicts=('oryx-music-player')
options=('!strip' '!debug')
source=(
  "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
  'oryx-music-player.desktop'
)
source_x86_64=(
  "${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_x86_64.tar.gz"
)
sha256sums=('c373c05e9d8d06d7aa53cc1d5fba2b9d3fa8776aae1b3720d104f594f9dd771f'
            '23563fd2c80b90aed3a708a54cb1d4f5f20ef014508f5cc4c330a7e3b24301d1')
sha256sums_x86_64=('44b7e49c237356d3de0f46b7f239337be4319bb63dcfccab77cd5da21e6b4107')

package() {
  install -Dm0755 "${srcdir}/usr/bin/${_pkgname}" \
    "${pkgdir}/usr/bin/oryx-music-player"

  install -Dm0644 "${srcdir}/usr/share/icons/hicolor/1024x1024@2/apps/${_pkgname}.png" \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024@2/apps/oryx-music-player.png"

  install -Dm0644 "${srcdir}/oryx-music-player.desktop" \
    "${pkgdir}/usr/share/applications/oryx-music-player.desktop"

  install -Dm0644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
