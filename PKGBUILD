# Maintainer: Kamil "elwin013" Banach <kontakt at elwin013.com>
pkgname=javablock
pkgver=0.6.1
pkgrel=1
pkgdesc="Free Java Flowchart simulator / interpreter"
arch=('i686' 'x86_64')
url="http://javablock.sourceforge.net/"
license=('freeware/GPL')
depends=('java-runtime')
source=(http://sourceforge.net/projects/${pkgname}/files/0.6/${pkgver}/install.zip/download
javablock.png
javablock.desktop
javablock)
md5sums=('244c8975247941198389e1bf02712c85'
         '61e167a071d787a7a93a48347e9292a1'
         'db8f696ee85b1444d8176eb45d3373f3'
         'b7093a88b12344924668dc6c348ef8dd')

package() {
  mkdir -p ${pkgdir}/usr/share/java/javablock/ ${pkgdir}/usr/share/pixmaps \
           ${pkgdir}/usr/share/applications ${pkgdir}/usr/bin
  mv ${srcdir}/install/*.jar ${pkgdir}/usr/share/java/javablock/
  
  mv ${srcdir}/install/modules/Lib.zip ${srcdir}/install/modules/Lib
  mv ${srcdir}/install/modules ${pkgdir}/usr/share/java/javablock/
  
  install --mode=755 ${pkgname} ${pkgdir}/usr/bin/
  install --mode=644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install --mode=644 ${pkgname}.png ${pkgdir}/usr/share/pixmaps/
}
