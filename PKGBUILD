pkgname=chicken-srfi-196
_name=srfi-196
pkgver=1.0.1
pkgrel=1
pkgdesc='SRFI-196: Range Objects for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-srfi-1" "chicken-srfi-133" "chicken-typed-records" "chicken-utf8")
url='http://wiki.call-cc.org/eggref/5/srfi-196'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

