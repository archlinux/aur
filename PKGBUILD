pkgname=chicken-bitwise-utils
_name=bitwise-utils
pkgver=1.3.0
pkgrel=1
pkgdesc='Bitwise utilities for Chicken Scheme'
arch=('x86_64')
license=('Public Domain')
depends=("chicken")
url='http://wiki.call-cc.org/eggref/5/bitwise-utils'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

