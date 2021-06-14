# Maintainer: chp321 [at] gmail [dot] com

pkgname=ldt
pkgver=1.4.2
pkgrel=2
pkgdesc='IDE for lua language. Standalone eclipse plugin.'
arch=('i686' 'x86_64')
url="https://eclipse.org/${pkgname}/"
license=('GPL')
depends=('java-runtime')

source_x86_64=("${pkgname}.desktop" "https://download.eclipse.org/${pkgname}/products/stable/${pkgver}/org.eclipse.${pkgname}.product-linux.gtk.x86_64.tar.gz")
md5sums_x86_64=('04ac4a4c273d96e7c2fb7e2d9c6c3987' 'a95cce436d97383d1a0992fcab2ff247')

source_i686=("${pkgname}.desktop" "https://download.eclipse.org/${pkgname}/products/stable/${pkgver}/org.eclipse.${pkgname}.product-linux.gtk.x86.tar.gz")
md5sums_i686=('04ac4a4c273d96e7c2fb7e2d9c6c3987' '5e9e55ac60278cdf9d3b67d7b89ef27b')


package() {
  mkdir -p ${pkgdir}/opt/

  # desktop file
  install -Dm644 ${srcdir}/${pkgname}.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  # icon
  install -Dm644 ${srcdir}/icon.xpm $pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname}.xpm
  
  mv ${srcdir}/ ${pkgdir}/opt/
  cd ${pkgdir}/opt/
  mv src ldt
}
