pkgname=chicken-srfi-144
_name=srfi-144
pkgver=0.1.3
pkgrel=1
pkgdesc='SRFI 144: Flonums for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-r7rs")
url='http://wiki.call-cc.org/eggref/5/srfi-144'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

