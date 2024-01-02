pkgname=chicken-uri-generic
_name=uri-generic
pkgver=3.3
pkgrel=1
pkgdesc='Chicken Scheme URI generic syntax (RFC 3986) parsing and manipulation.'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-matchable" "chicken-srfi-1" "chicken-srfi-14")
url='http://wiki.call-cc.org/eggref/5/uri-generic'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

