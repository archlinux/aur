pkgname=chicken-srfi-69
_name=srfi-69
pkgver=0.4.3
pkgrel=1
pkgdesc='Chicken Scheme SRFI-69 hash-table library'
arch=('x86_64')
license=('BSD')
depends=("chicken")
url='http://wiki.call-cc.org/eggref/5/srfi-69'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f | xargs -I {} cp {} ${pkgdir}/usr/lib/chicken/11
}

