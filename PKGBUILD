pkgname=chicken-json
_name=json
pkgver=1.6
pkgrel=1
pkgdesc='A JSON library for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-packrat" "chicken-srfi-1" "chicken-srfi-69")
url='http://wiki.call-cc.org/eggref/5/json'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

