pkgname=chicken-srfi-207
_name=srfi-207
pkgver=2.0.0
pkgrel=1
pkgdesc='SRFI-207: String-notated bytevectors for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-srfi-1" "chicken-srfi-13" "chicken-srfi-151" "chicken-r7rs")
url='http://wiki.call-cc.org/eggref/5/srfi-207'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

