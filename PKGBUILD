pkgname=chicken-utf8
_name=utf8
pkgver=3.6.3
pkgrel=1
pkgdesc='Unicode support for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-srfi-69" "chicken-iset" "chicken-regex")
url='http://wiki.call-cc.org/eggref/5/utf8'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

