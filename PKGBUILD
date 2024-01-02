pkgname=chicken-srfi-42
_name=srfi-42
pkgver=1.76
pkgrel=1
pkgdesc='SRFI-42 (Eager comprehensions) for Chicken Scheme'
arch=('x86_64')
license=('SRFI')
depends=("chicken" "chicken-srfi-1" "chicken-srfi-13")
url='http://wiki.call-cc.org/eggref/5/srfi-42'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

