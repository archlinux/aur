pkgname=chicken-lowdown
_name=lowdown
pkgver=3
pkgrel=3
pkgdesc='A pure Chicken Markdown parser for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-char-set-literals" "chicken-clojurian" "chicken-comparse" "chicken-fancypants" "chicken-srfi-1" "chicken-srfi-13" "chicken-srfi-14" "chicken-srfi-69" "chicken-sxml-transforms")
url='http://wiki.call-cc.org/eggref/5/lowdown'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

