pkgname=chicken-srfi-41
_name=srfi-41
pkgver=2.1.5
pkgrel=1
pkgdesc='SRFI 41 (Streams) for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-srfi-1" "chicken-record-variants" "chicken-check-errors>=3.6.0")
url='http://wiki.call-cc.org/eggref/5/srfi-41'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

