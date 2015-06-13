# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kvideodownloader
pkgver=3.5.5.1700
pkgrel=1
pkgdesc="Quickly download videos from YouTube in high-quality."
arch=('i686' 'x86_64')
url="http://www.4kdownload.com/products/product-videodownloader"
license=('custom:eula')
depends=('qt5-script' 'portaudio' 'ffmpeg-compat' 'ffmpeg-compat-55>=2.3.4-2')
source=("${pkgname}.desktop"
        "${pkgname}.png")
source_i686=("http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_i386.tar.bz2")
source_x86_64=("http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_amd64.tar.bz2")
sha256sums=('6ab39088bde330267b43f87878f6bd47a215c732e17d417a99fc23ac4c568952'
            '56b851ef96aade0612f236b8763ccaf2def8acdd49f37bbefdd79e1d5f6e68be')
sha256sums_i686=('f8dfccba34970f2ac439ea80b58a31d87a1b55c544872930d53bc1547907b46b')
sha256sums_x86_64=('be635c525552b0c1dfe2db5b65a78b24d54dbb2d37e5b68f2f36886658fc7284')

package() {
  install -m 755 -D "${srcdir}/${pkgname}/${pkgname}-bin" "${pkgdir}/usr/bin/${pkgname}"
  install -m 644 -D "${srcdir}/${pkgname}/doc/eula" "${pkgdir}/usr/share/licenses/${pkgname}/eula" 
  install -m 755 -D "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -m 755 -D "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
