pkgname=chicken-pstk
_name=pstk
pkgver=1.4.0
pkgrel=1
pkgdesc='PS/Tk: Portable Scheme interface to Tk for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-srfi-1" "chicken-srfi-13")
url='http://wiki.call-cc.org/eggref/5/pstk'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

