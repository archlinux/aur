pkgname=chicken-vector-lib
_name=vector-lib
pkgver=2.1.1
pkgrel=1
pkgdesc='Port of the SRFI-43 reference implementation for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken")
url='http://wiki.call-cc.org/eggref/5/vector-lib'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

