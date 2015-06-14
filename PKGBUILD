# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: L.G. Sarmiento <lgsarmientop-ala-unal.edu.co>
pkgname=gnuscope
pkgver=1.0
pkgrel=1
pkgdesc="The next evolution of the scope fit family of functions with improved graphics and greater functionality. For use with PGAM and GS92 data. Designed for ease of use."
url="http://sourceforge.net/projects/gnuscope/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gtk')
source=("gnuscope.tar.gz::http://sourceforge.net/projects/gnuscope/files/latest/download/"
  'gnuscope.patch')
md5sums=('105060e7e8a0e3594f2be9c1a9cb4f3b'
  '0109aa771dfec6b01a770b611e7fd6cc')
build() {
  cd $srcdir
  make clean
  patch -p1 -d ${srcdir} < ${srcdir}/gnuscope.patch
  
  make
}

package(){
  install -d ${pkgdir}/usr/bin
  install -m755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin
}
