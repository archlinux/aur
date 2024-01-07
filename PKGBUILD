pkgname=chicken-apropos
_name=apropos
pkgver=3.8.3
pkgrel=1
pkgdesc='Chicken Scheme apropos'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-srfi-1" "chicken-utf8" "chicken-string-utils" "chicken-symbol-utils" "chicken-check-errors>=3.4.0")
url='http://wiki.call-cc.org/eggref/5/apropos'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

