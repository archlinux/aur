pkgname=chicken-condition-utils
_name=condition-utils
pkgver=2.2.3
pkgrel=1
pkgdesc='SRFI 12 Condition Utilities for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-srfi-1" "chicken-srfi-69" "chicken-check-errors")
url='http://wiki.call-cc.org/eggref/5/condition-utils'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

