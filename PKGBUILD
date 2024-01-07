pkgname=chicken-chicken-doc
_name=chicken-doc
pkgver=0.7.0
pkgrel=1
pkgdesc='Explore Chicken Scheme documentation locally'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-matchable" "chicken-fmt" "chicken-sxml-transforms" "chicken-srfi-1" "chicken-srfi-13" "chicken-srfi-69")
url='http://wiki.call-cc.org/eggref/5/chicken-doc'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +

  install -d ${pkgdir}/usr/bin
  cp -a ${srcdir}/bin/* ${pkgdir}/usr/bin
}

