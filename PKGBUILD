pkgname=chicken-pyffi
_name=pyffi
pkgver=3.14
pkgrel=1
pkgdesc='An interface to the Python programming language for Chicken Scheme'
arch=('x86_64')
license=('GPL-3')
depends=("chicken" "chicken-srfi-1" "chicken-srfi-69" "chicken-bind" "chicken-utf8")
url='http://wiki.call-cc.org/eggref/5/pyffi'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

