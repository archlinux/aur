pkgname=chicken-srfi-116
_name=srfi-116
pkgver=1.7
pkgrel=1
pkgdesc='SRFI-116: Immutable Lists. for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-srfi-128")
url='http://wiki.call-cc.org/eggref/5/srfi-116'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

