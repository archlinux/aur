pkgname=chicken-srfi-71
_name=srfi-71
pkgver=0.2
pkgrel=1
pkgdesc='SRFI-71: Extended LET-syntax for multiple values for Chicken Scheme'
arch=('x86_64')
license=('SRFI')
depends=("chicken")
url='http://wiki.call-cc.org/eggref/5/srfi-71'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

