pkgname=chicken-symbol-utils
_name=symbol-utils
pkgver=2.5.0
pkgrel=1
pkgdesc='Symbol Utilities for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-utf8")
url='http://wiki.call-cc.org/eggref/5/symbol-utils'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

