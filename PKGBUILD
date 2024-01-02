pkgname=chicken-srfi-113
_name=srfi-113
pkgver=1.2.0
pkgrel=1
pkgdesc='SRFI-113: Sets and Bags for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-r7rs" "chicken-srfi-69" "chicken-srfi-128")
url='http://wiki.call-cc.org/eggref/5/srfi-113'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

