pkgname=chicken-uri-common
_name=uri-common
pkgver=2.0
pkgrel=1
pkgdesc='Chicken Scheme Parser for common URI schemes'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-uri-generic" "chicken-defstruct" "chicken-matchable" "chicken-srfi-1" "chicken-srfi-13" "chicken-srfi-14")
url='http://wiki.call-cc.org/eggref/5/uri-common'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

