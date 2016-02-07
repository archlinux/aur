# Maintainer: chp321 [at] gmail [dot] com

pkgname=ldt
pkgver=1.3.1
pkgrel=2
pkgdesc='IDE for lua language. Standalone eclipse plugin.'
arch=('x86_64')
url="https://eclipse.org/${pkgname}/"
license=('GPL')
depends=('java-runtime')
source=("http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/${pkgname}/products/stable/${pkgver}/org.eclipse.${pkgname}.product-linux.gtk.x86_64.tar.gz" "${pkgname}.desktop")
md5sums=('ffc8d97e364825d337362fa1263c0df9' '04ac4a4c273d96e7c2fb7e2d9c6c3987')

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
