pkgname=chicken-srfi-27
_name=srfi-27
pkgver=4.2.3
pkgrel=1
pkgdesc='Sources of Random Bits for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-srfi-1" "chicken-vector-lib" "chicken-timed-resource" "chicken-miscmacros" "chicken-check-errors>=3.6.0")
url='http://wiki.call-cc.org/eggref/5/srfi-27'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

