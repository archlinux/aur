pkgname=chicken-srfi-227
_name=srfi-227
pkgver=1.1
pkgrel=1
pkgdesc='SRFI 227: Optional Arguments for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-srfi-1")
url='http://wiki.call-cc.org/eggref/5/srfi-227'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

