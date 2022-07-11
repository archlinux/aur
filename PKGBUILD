# Contributor: Médéric Boquien <mboquien@free.fr>
pkgname=wcstools
pkgver=3.9.7
pkgrel=1
pkgdesc="A package of programs for setting and using the world coordinate systems"
arch=('i686' 'x86_64')
url="http://tdc-www.harvard.edu/wcstools/"
license=('GPL2')
options=('makeflags')
source=(http://tdc-www.harvard.edu/software/wcstools/wcstools-${pkgver}.tar.gz)
sha512sums=('a785b87eb8715e6408b463b42f521eaa7b22096346b83b7e76dc068954dd299ef892ac990326b46fef349d9581416dc34d7b1df0fcf41096a4f2c8bf2ed2677b')

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
