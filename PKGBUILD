pkgname=chicken-srfi-19
_name=srfi-19
pkgver=4.9.5
pkgrel=1
pkgdesc='Time Data Types and Procedures for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-srfi-1" "chicken-utf8" "chicken-srfi-18" "chicken-srfi-29" "chicken-miscmacros" "chicken-locale" "chicken-record-variants" "chicken-check-errors>=3.6.0")
url='http://wiki.call-cc.org/eggref/5/srfi-19'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

