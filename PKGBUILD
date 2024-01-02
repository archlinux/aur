pkgname=chicken-defstruct
_name=defstruct
pkgver=2.0
pkgrel=1
pkgdesc='Chicken Scheme A more convenient form of define-record'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-srfi-1")
url='http://wiki.call-cc.org/eggref/5/defstruct'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

