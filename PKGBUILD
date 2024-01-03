pkgname=chicken-comparse
_name=comparse
pkgver=3
pkgrel=1
pkgdesc='Schemely parser combinators for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-lazy-seq>=0.1.0" "chicken-trie" "chicken-matchable" "chicken-srfi-1" "chicken-srfi-13" "chicken-srfi-14" "chicken-srfi-69")
url='http://wiki.call-cc.org/eggref/5/comparse'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

