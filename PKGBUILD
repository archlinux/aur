# Contributor: Médéric Boquien <mboquien@free.fr>
pkgname=wcstools
pkgver=3.9.6
pkgrel=1
pkgdesc="A package of programs for setting and using the world coordinate systems"
arch=('i686' 'x86_64')
url="http://tdc-www.harvard.edu/wcstools/"
license=('GPL2')
options=('makeflags')
source=(http://tdc-www.harvard.edu/software/wcstools/wcstools-${pkgver}.tar.gz)
sha512sums=('b971c9c65ba09b8904b09bd14d8e0fbc220dabc7eea9a94fbb39e5710e6e340e712b64954e51f7f11a1406a8600afa65670deef9662e071ad42e0a92c0929341')

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
