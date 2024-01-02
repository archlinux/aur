pkgname=chicken-http-client
_name=http-client
pkgver=1.2.1
pkgrel=1
pkgdesc='Chicken Scheme High-level HTTP client library'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-intarweb" "chicken-uri-common" "chicken-simple-md5" "chicken-sendfile" "chicken-srfi-1" "chicken-srfi-13" "chicken-srfi-18" "chicken-srfi-69")
url='http://wiki.call-cc.org/eggref/5/http-client'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f | xargs -I {} cp {} ${pkgdir}/usr/lib/chicken/11
}

