# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kslideshowmaker
pkgver=1.5.5.895
pkgrel=2
pkgdesc="A straightforward and easy-to-use app to create slideshows from music and photos, with Instagram support."
arch=('i686' 'x86_64')
url="http://www.4kdownload.com/products/product-slideshowmaker"
license=('custom:eula')
depends=('qt5-quickcontrols' 'libexif' 'portaudio' 'libjpeg9' 'ffmpeg-compat' 'ffmpeg-compat-55' 'libvpx-1.3')
source=("${pkgname}.desktop"
        "${pkgname}.png")
source_i686=("http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_i386.tar.bz2")
source_x86_64=("http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_amd64.tar.bz2")
sha256sums=('e77851c895f713a7f615010c0b62d0749254dac5178f9853ae45a915ac1f84f0'
            '8e14e4f39f5b794b56dfe7246723e62b59ab9d664330065847cc90654aee3468')
sha256sums_i686=('388236ace1a687770875ae9ddc9f73673cdc28df9ab5c5286020b588a2886b40')
sha256sums_x86_64=('421755add18a3df10d26cc520c7e3ae8f7273238421b0a19d18cc42736c8a97a')

package() {
  install -m 755 -D "${srcdir}/${pkgname}/${pkgname}-bin" "${pkgdir}/usr/bin/${pkgname}"
  install -m 644 -D "${srcdir}/${pkgname}/doc/eula" "${pkgdir}/usr/share/licenses/${pkgname}/eula" 
  install -m 755 -D "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -m 755 -D "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
