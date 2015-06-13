# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kvideotomp3
pkgver=2.2.0.800
pkgrel=2
pkgdesc="Extract audio in high-quality MP3 from any video."
arch=('i686' 'x86_64')
url="http://www.4kdownload.com/products/product-videotomp3"
license=('custom:eula')
depends=('qt5-quickcontrols' 'portaudio' 'ffmpeg-compat' 'ffmpeg-compat-55' 'libvpx-1.3')
source=("${pkgname}.desktop"
        "${pkgname}.png")
source_i686=("http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_i386.tar.bz2")
source_x86_64=("http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_amd64.tar.bz2")
sha256sums=('a53e776426f30fd1d35b5d78df95f3608f25a8637a7c5f0c731ff538226c2185'
            '3aa5efcf8111c63fde7397f491d2b85ff47d50fd531f7792842d94016b814a4c')
sha256sums_i686=('eaf39eeb1b918b1cf5898125fba18a020ea89c21557a0e4907177e315dc6941e')
sha256sums_x86_64=('25c3538983b19006827bb1b362e37efc6f20828ab9377713c12ab4e9c49faa61')

package() {
  install -m 755 -D "${srcdir}/${pkgname}/${pkgname}-bin" "${pkgdir}/usr/bin/${pkgname}"
  install -m 644 -D "${srcdir}/${pkgname}/doc/eula" "${pkgdir}/usr/share/licenses/${pkgname}/eula" 
  install -m 755 -D "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -m 755 -D "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
