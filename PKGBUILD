pkgname=chicken-srfi-123
_name=srfi-123
pkgver=0.2.1
pkgrel=1
pkgdesc='SRFI-123 - Generic accessor and modifier operations for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-srfi-99" "chicken-box" "chicken-r7rs")
url='http://wiki.call-cc.org/eggref/5/srfi-123'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

