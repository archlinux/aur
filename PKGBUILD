pkgname=chicken-srfi-151
_name=srfi-151
pkgver=1.0.2
pkgrel=1
pkgdesc='SRFI 151: Bitwise Operations for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken")
url='http://wiki.call-cc.org/eggref/5/srfi-151'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

