pkgname=chicken-srfi-60
_name=srfi-60
pkgver=0.7.1
pkgrel=1
pkgdesc='SRFI 60: Integers as bits for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-bitwise-utils")
url='http://wiki.call-cc.org/eggref/5/srfi-60'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

