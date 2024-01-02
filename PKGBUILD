pkgname=chicken-alist-lib
_name=alist-lib
pkgver=0.3.0
pkgrel=1
pkgdesc='SRFI-69-like library for alists for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-hahn>=0.9.3" "chicken-matchable" "chicken-srfi-1")
url='http://wiki.call-cc.org/eggref/5/alist-lib'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

