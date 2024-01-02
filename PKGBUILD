pkgname=chicken-typed-records
_name=typed-records
pkgver=0.82
pkgrel=1
pkgdesc='Typed variants of various record-definition macros for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-defstruct")
url='http://wiki.call-cc.org/eggref/5/typed-records'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

