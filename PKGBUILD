# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kvideodownloader
pkgver=3.6.1.1770
pkgrel=1
pkgdesc="Quickly download videos from YouTube in high-quality."
arch=('i686' 'x86_64')
url="http://www.4kdownload.com/products/product-videodownloader"
license=('custom:eula')
depends=('qt5-script' 'portaudio' 'ffmpeg-compat' 'ffmpeg-compat-55')
source=("${pkgname}.desktop"
        "${pkgname}.png")
source_i686=("http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_i386.tar.bz2")
source_x86_64=("http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_amd64.tar.bz2")
sha256sums=('6ab39088bde330267b43f87878f6bd47a215c732e17d417a99fc23ac4c568952'
            '56b851ef96aade0612f236b8763ccaf2def8acdd49f37bbefdd79e1d5f6e68be')
sha256sums_i686=('a979432c3fa1c1383969195d71d5e00f73f05070e372dc0a6e72eb6ee456f817')
sha256sums_x86_64=('84c8e56a736319f5bc7dac329c3eb0dcec0c8dbda91fc89fc4dddab53f23dbf4')

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
