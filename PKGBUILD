# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kstogram
pkgver=2.5.1.1346
pkgrel=1
pkgdesc="Download and backup Instagram photos shared by any user."
arch=('i686' 'x86_64')
url="http://www.4kdownload.com/products/product-stogram"
license=('custom:eula')
depends=('qt5-script' 'qt5-quickcontrols' 'qt5-graphicaleffects' 'libexif' 'libjpeg9')
source=("${pkgname}.desktop"
        "${pkgname}.png")
source_i686=("${pkgname}_${pkgver}_i386.tar.bz2"::"https://downloads2.4kdownload.com/app/${pkgname}_${pkgver%.*}_i386.tar.bz2")
source_x86_64=("${pkgname}_${pkgver}_amd64.tar.bz2"::"https://downloads2.4kdownload.com/app/${pkgname}_${pkgver%.*}_amd64.tar.bz2")
sha256sums=('7970c1f1aacd5a546ca8252c2d48a874478a26e23eb57769f54c5feac7316f51'
            'b1add61c84f745911dee0672b25e021a3da0d90127843f3a814864858306ab8b')
sha256sums_i686=('eb1234a4868adf1a8fac8073c0e26b94e0d6c1f3ce109fab413d73d42fbf6bd6')
sha256sums_x86_64=('10d31bba04810d2b13bb0db159d9003f97a15e3a5bda57dfb76099ca63e1dd83')

package() {
  # Install desktop file
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  # Install icon file
  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  install -m 644 -t "${pkgdir}/usr/share/pixmaps" "${pkgname}.png"
  # Install files
  cd "${pkgname}"
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "${pkgname}-bin"
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/translation"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}/translation" translation/*
  # Install launcher file
  install -m 755 -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/${pkgname}-bin" "${pkgdir}/usr/bin/${pkgname}"
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "doc/eula"
}
