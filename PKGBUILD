pkgname=chicken-integer-map
_name=integer-map
pkgver=1.0.3
pkgrel=1
pkgdesc='SRFI 224 integer mappings for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-srfi-1" "chicken-srfi-128" "chicken-srfi-143" "chicken-srfi-158")
url='http://wiki.call-cc.org/eggref/5/integer-map'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

