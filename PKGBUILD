# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kslideshowmaker
pkgver=1.5.6.903
pkgrel=2
pkgdesc="A straightforward and easy-to-use app to create slideshows from music and photos, with Instagram support."
arch=('i686' 'x86_64')
url="http://www.4kdownload.com/products/product-slideshowmaker"
license=('custom:eula')
depends=('qt5-quickcontrols' 'libexif' 'portaudio' 'ffmpeg-compat' 'ffmpeg-compat-55' 'libjpeg9')
source=("${pkgname}.desktop"
        "${pkgname}.png")
source_i686=("http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_i386.tar.bz2")
source_x86_64=("http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_amd64.tar.bz2")
sha256sums=('e77851c895f713a7f615010c0b62d0749254dac5178f9853ae45a915ac1f84f0'
            '8e14e4f39f5b794b56dfe7246723e62b59ab9d664330065847cc90654aee3468')
sha256sums_i686=('3913bb6472788a0abd1ed4a07a877564fb832d86f490a33b60e04f7188db9a75')
sha256sums_x86_64=('839571673959539347f4157e0e2e77f5f14078d75bd78961210f11f560c268cd')

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
