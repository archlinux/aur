pkgname=chicken-henrietta-cache
_name=henrietta-cache
pkgver=1.6.1
pkgrel=2
pkgdesc='Fetch and cache extensions from various sources for Chicken Scheme Henrietta to consume'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-http-client" "chicken-matchable" "chicken-srfi-1")
url='http://wiki.call-cc.org/eggref/5/henrietta-cache'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f | xargs -I {} cp {} ${pkgdir}/usr/lib/chicken/11

  install -d ${pkgdir}/usr/bin
    cp -a ${srcdir}/bin/* ${pkgdir}/usr/bin
}

