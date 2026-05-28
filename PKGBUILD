# Maintainer: Behzad Ehsani <ehsani.eof at gmail dot com>

pkgname=oryx-music-player-bin
_pkgname=oryx
pkgver=0.1.9
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
sha256sums=(
  'c373c05e9d8d06d7aa53cc1d5fba2b9d3fa8776aae1b3720d104f594f9dd771f'
  'c864a2c89fedf9ee64a33cb82473abaefb819da5615f364ff01229fdb5aed124'
)
sha256sums_x86_64=(
  '46384a3cd433e34b961e398f4cc34404f6d6deadad9e83191382c4ec40c3631f'
)

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
