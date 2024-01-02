pkgname=chicken-srfi-135
_name=srfi-135
pkgver=1.0.2
pkgrel=1
pkgdesc='SRFI 135: Immutable Texts for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-r7rs" "chicken-utf8" "chicken-srfi-141" "chicken-typed-records")
url='http://wiki.call-cc.org/eggref/5/srfi-135'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

