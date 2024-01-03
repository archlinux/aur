pkgname=chicken-module-declarations
_name=module-declarations
pkgver=0.3.1
pkgrel=1
pkgdesc='Module declarations for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-matchable" "chicken-srfi-1")
url='http://wiki.call-cc.org/eggref/5/module-declarations'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

