pkgname=chicken-srfi-99
_name=srfi-99
pkgver=1.4.5
pkgrel=1
pkgdesc='SRFI-99 record types for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-srfi-1" "chicken-srfi-69" "chicken-miscmacros")
url='http://wiki.call-cc.org/eggref/5/srfi-99'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

