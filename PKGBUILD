pkgname=chicken-srfi-217
_name=srfi-217
pkgver=0.2
pkgrel=1
pkgdesc='SRFI 217: Integer Sets for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-srfi-1" "chicken-srfi-143" "chicken-typed-records")
url='http://wiki.call-cc.org/eggref/5/srfi-217'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

