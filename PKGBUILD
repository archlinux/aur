pkgname=chicken-fmt
_name=fmt
pkgver=0.8.11.2
pkgrel=1
pkgdesc='Combinator Formatting for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-srfi-1" "chicken-srfi-13" "chicken-srfi-69" "chicken-utf8")
url='http://wiki.call-cc.org/eggref/5/fmt'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

