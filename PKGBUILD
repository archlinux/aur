pkgname=chicken-string-utils
_name=string-utils
pkgver=2.7.3
pkgrel=1
pkgdesc='String Utilities for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-utf8" "chicken-srfi-1" "chicken-srfi-13" "chicken-srfi-69" "chicken-miscmacros" "chicken-check-errors>=3.5.0")
url='http://wiki.call-cc.org/eggref/5/string-utils'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

