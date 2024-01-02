pkgname=chicken-srfi-132
_name=srfi-132
pkgver=1.0.0
pkgrel=1
pkgdesc='SRFI-132: Sort Libraries for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-srfi-133")
url='http://wiki.call-cc.org/eggref/5/srfi-132'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

