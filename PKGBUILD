pkgname=chicken-intarweb
_name=intarweb
pkgver=2.0.3
pkgrel=1
pkgdesc='Chicken Scheme A more convenient HTTP library'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-srfi-1" "chicken-srfi-13" "chicken-srfi-14" "chicken-defstruct" "chicken-uri-common" "chicken-base64")
url='http://wiki.call-cc.org/eggref/5/intarweb'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

