# Maintainer: chp321 [at] gmail [dot] com

pkgname=ldt
pkgver=1.3.1
pkgrel=3
pkgdesc='IDE for lua language. Standalone eclipse plugin.'
arch=('i686' 'x86_64')
url="https://eclipse.org/${pkgname}/"
license=('GPL')
depends=('java-runtime')
source=("${pkgname}.desktop")
md5sums=('04ac4a4c273d96e7c2fb7e2d9c6c3987')
if test "$CARCH" == x86_64; then
  source+=("http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/${pkgname}/products/stable/${pkgver}/org.eclipse.${pkgname}.product-linux.gtk.x86_64.tar.gz")
  md5sums+=('ffc8d97e364825d337362fa1263c0df9')
fi
if test "$CARCH" == i686; then
  source+=("http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/${pkgname}/products/stable/${pkgver}/org.eclipse.${pkgname}.product-linux.gtk.x86.tar.gz")
  md5sums+=('3eb6411773fdb4d403b6c8ad6d047b74')
fi


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
