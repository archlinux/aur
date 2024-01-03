pkgname=chicken-srfi-45
_name=srfi-45
pkgver=4.0.7
pkgrel=1
pkgdesc='SRFI-45: Primitives for Expressing Iterative Lazy Algorithms for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-record-variants" "chicken-check-errors")
url='http://wiki.call-cc.org/eggref/5/srfi-45'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

