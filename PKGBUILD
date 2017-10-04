# Maintainer: chp321 [at] gmail [dot] com

pkgname=ldt
pkgver=1.4.1
pkgrel=1
pkgdesc='IDE for lua language. Standalone eclipse plugin.'
arch=('i686' 'x86_64')
url="https://eclipse.org/${pkgname}/"
license=('GPL')
depends=('java-runtime')

source_x86_64=("${pkgname}.desktop" "http://download.eclipse.org/${pkgname}/products/stable/${pkgver}/org.eclipse.${pkgname}.product-linux.gtk.x86_64.tar.gz")
md5sums_x86_64=('04ac4a4c273d96e7c2fb7e2d9c6c3987' 'ebc36a06a05af1e8522dd1dbe098c570')

source_i686=("${pkgname}.desktop" "http://download.eclipse.org/${pkgname}/products/stable/${pkgver}/org.eclipse.${pkgname}.product-linux.gtk.x86.tar.gz")
md5sums_i686=('04ac4a4c273d96e7c2fb7e2d9c6c3987' '2d86716db3d94b5ba16b21b4b7e72c4e')


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
