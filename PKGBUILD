pkgname=chicken-srfi-101
_name=srfi-101
pkgver=0.0.3
pkgrel=1
pkgdesc='SRFI 101 for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-srfi-1" "chicken-srfi-69" "chicken-vector-lib")
url='http://wiki.call-cc.org/eggref/5/srfi-101'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

