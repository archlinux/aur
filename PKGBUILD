pkgname=chicken-srfi-189
_name=srfi-189
pkgver=1.0.3
pkgrel=1
pkgdesc='SRFI 189: Maybe and Either for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-srfi-1" "chicken-typed-records")
url='http://wiki.call-cc.org/eggref/5/srfi-189'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

