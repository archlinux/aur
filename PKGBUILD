pkgname=chicken-coops
_name=coops
pkgver=1.3
pkgrel=1
pkgdesc='A featureful object system for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-matchable" "chicken-miscmacros" "chicken-record-variants" "chicken-srfi-1")
url='http://wiki.call-cc.org/eggref/5/coops'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

