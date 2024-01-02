pkgname=chicken-srfi-115
_name=srfi-115
pkgver=0.3.2
pkgrel=1
pkgdesc='SRFI 115: Scheme Regular Expressions for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-srfi-14" "chicken-srfi-152")
url='http://wiki.call-cc.org/eggref/5/srfi-115'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

