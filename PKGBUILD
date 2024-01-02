pkgname=chicken-srfi-4-comprehensions
_name=srfi-4-comprehensions
pkgver=1.5
pkgrel=1
pkgdesc='SRFI-42 Comprehensions for SRFI-4 Vectors for Chicken Scheme'
arch=('x86_64')
license=('SRFI')
depends=("chicken" "chicken-srfi-42")
url='http://wiki.call-cc.org/eggref/5/srfi-4-comprehensions'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

