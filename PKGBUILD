pkgname=chicken-srfi-105
_name=srfi-105
pkgver=0.1.7
pkgrel=1
pkgdesc='SRFI-105 - curly infix expressions for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-srfi-13" "chicken-srfi-1" "chicken-srfi-123")
url='http://wiki.call-cc.org/eggref/5/srfi-105'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

