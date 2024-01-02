pkgname=chicken-srfi-95
_name=srfi-95
pkgver=2.0
pkgrel=1
pkgdesc='SRFI-95: Sorting and merging for Chicken Scheme'
arch=('x86_64')
license=('Public Domain')
depends=("chicken" "chicken-srfi-63")
url='http://wiki.call-cc.org/eggref/5/srfi-95'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

