# Contributor: Médéric Boquien <mboquien@free.fr>
pkgname=wcstools
pkgver=3.9.4
pkgrel=1
pkgdesc="A package of programs for setting and using the world coordinate systems"
arch=('i686' 'x86_64')
url="http://tdc-www.harvard.edu/wcstools/"
license=('GPL2')
options=('makeflags')
source=(http://tdc-www.harvard.edu/software/wcstools/wcstools-${pkgver}.tar.gz)
md5sums=('1f80336f3d78953f797d86e18792652c')

build() {
  cd ${srcdir}/wcstools-${pkgver}
  make all || return 1
}

package() {
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/man/man1
  install ${srcdir}/wcstools-${pkgver}/bin/* ${pkgdir}/usr/bin
  install ${srcdir}/wcstools-${pkgver}/man/man1/* ${pkgdir}/usr/share/man/man1
}
