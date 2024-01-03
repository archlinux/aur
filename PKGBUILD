pkgname=chicken-bind
_name=bind
pkgver=1.2.6
pkgrel=1
pkgdesc='Automatically generate bindings from C/C++ declarations for Chicken Scheme'
arch=('x86_64')
license=('public domain')
depends=("chicken" "chicken-silex" "chicken-matchable" "chicken-coops" "chicken-srfi-1" "chicken-regex")
url='http://wiki.call-cc.org/eggref/5/bind'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

