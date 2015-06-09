# Author:  Stunts <f.pinamartins@gmail.com>

pkgname=r8s
pkgver=1.80
pkgrel=2
pkgdesc="Analysis of rates ("r8s") of evolution"
arch=(i686 x86_64)
license=('Public Domain')
depends=('gcc-libs' 'gcc-fortran')
url="http://loco.biosci.arizona.edu/r8s/"
source=(http://loco.biosci.arizona.edu/r8s/${pkgname}.dist.tgz)
md5sums=('ce39fde6778dfdf9f20442a573c685db')

build() {
  cd "${srcdir}/dist"
  make -f makefile
}

package() {
  cd "${srcdir}/dist"
  install -d ${pkgdir}/usr
  install -d ${pkgdir}/usr/bin
  install -D -m 755 r8s ${pkgdir}/usr/bin/
}
