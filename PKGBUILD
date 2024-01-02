pkgname=chicken-dyn-vector
_name=dyn-vector
pkgver=2.1
pkgrel=1
pkgdesc='Dynamic (dense) vectors based on SRFI-43. for Chicken Scheme'
arch=('x86_64')
license=('LGPL-3')
depends=("chicken" "chicken-srfi-1" "chicken-vector-lib")
url='http://wiki.call-cc.org/eggref/5/dyn-vector'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

