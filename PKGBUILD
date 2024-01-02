pkgname=chicken-srfi-180
_name=srfi-180
pkgver=1.0.0
pkgrel=1
pkgdesc='Chicken Scheme library describes a JavaScript Object Notation (JSON) parser and printer. It supports JSON that may be bigger than memory'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-r7rs" "chicken-srfi-60" "chicken-srfi-145")
url='http://wiki.call-cc.org/eggref/5/srfi-180'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

