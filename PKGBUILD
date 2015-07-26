# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kyoutubetomp3
pkgver=2.10.6.1485
pkgrel=1
pkgdesc="Extract audio from YouTube, Vimeo, Facebook and other online video hosting services."
arch=('i686' 'x86_64')
url="http://www.4kdownload.com/products/product-youtubetomp3"
license=('custom:eula')
depends=('qt5-script' 'portaudio' 'ffmpeg-compat' 'ffmpeg-compat-55')
source=("${pkgname}.desktop"
        "${pkgname}.png")
source_i686=("http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_i386.tar.bz2")
source_x86_64=("http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_amd64.tar.bz2")
sha256sums=('386dfa4085efcd9403c4387c7be4dd0f9762c726555b5ebd0126dcd225bcf828'
            'b25f830bb1fe559ea9f0b35cc9eb8ab75e2e40d09b8755f937451f5ddeeec2fd')
sha256sums_i686=('f09f6cd10d85bd72bfe2ab43fae1371bc3833fe830e599b01a7630a0621b0feb')
sha256sums_x86_64=('af6300a31cf7fb0dee76979bd3985763b58bce707d306607d206b74b2e2d4c92')

package() {
  # Install executable file
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "${pkgname}/${pkgname}-bin" "${pkgdir}/usr/bin/${pkgname}"
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}/doc/eula"
  # Install desktop file
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  # Install icon file
  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  install -m 644 -t "${pkgdir}/usr/share/pixmaps" "${pkgname}.png"
}
