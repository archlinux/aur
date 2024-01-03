pkgname=chicken-char-set-literals
_name=char-set-literals
pkgver=0.4
pkgrel=1
pkgdesc='A reader extension providing Gauche style literals for SRFI-14 char-sets for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-srfi-14")
url='http://wiki.call-cc.org/eggref/5/char-set-literals'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

