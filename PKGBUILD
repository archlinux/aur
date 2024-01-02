pkgname=chicken-srfi-179
_name=srfi-179
pkgver=0.2.3
pkgrel=1
pkgdesc='SRFI-179: Nonempty Intervals and Generalized Arrays (Updated) for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-srfi-1" "chicken-srfi-133" "chicken-srfi-160")
url='http://wiki.call-cc.org/eggref/5/srfi-179'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

