pkgname=chicken-srfi-171
_name=srfi-171
pkgver=0.2
pkgrel=1
pkgdesc='SRFI-171: Transducers for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-r6rs-bytevectors" "chicken-vector-lib" "chicken-srfi-1" "chicken-srfi-69")
url='http://wiki.call-cc.org/eggref/5/srfi-171'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

