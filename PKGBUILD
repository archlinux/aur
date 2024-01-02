pkgname=chicken-srfi-128
_name=srfi-128
pkgver=0.11
pkgrel=1
pkgdesc='SRFI-128: Comparators (reduced) for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-srfi-13")
url='http://wiki.call-cc.org/eggref/5/srfi-128'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

