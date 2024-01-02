pkgname=chicken-srfi-209
_name=srfi-209
pkgver=1.3.1
pkgrel=1
pkgdesc='SRFI 209: Enums and enum sets for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-srfi-1" "chicken-srfi-69" "chicken-srfi-113" "chicken-srfi-128" "chicken-srfi-178" "chicken-typed-records")
url='http://wiki.call-cc.org/eggref/5/srfi-209'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

