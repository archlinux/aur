pkgname=chicken-srfi-29
_name=srfi-29
pkgver=3.0.7
pkgrel=1
pkgdesc='Localization for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-srfi-1" "chicken-srfi-69" "chicken-utf8" "chicken-locale" "chicken-posix-utils" "chicken-condition-utils" "chicken-check-errors>=3.6.0")
url='http://wiki.call-cc.org/eggref/5/srfi-29'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

