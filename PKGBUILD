pkgname=chicken-posix-utils
_name=posix-utils
pkgver=2.1.1
pkgrel=1
pkgdesc='posix-utils for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-srfi-1" "chicken-utf8" "chicken-check-errors>=3.5.0")
url='http://wiki.call-cc.org/eggref/5/posix-utils'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

