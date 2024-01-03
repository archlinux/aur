pkgname=chicken-interfaces
_name=interfaces
pkgver=0.4.1
pkgrel=1
pkgdesc='Simple interface/implementation abstraction for Chicken Scheme'
arch=('x86_64')
license=('public domain')
depends=("chicken" "chicken-srfi-1")
url='http://wiki.call-cc.org/eggref/5/interfaces'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

