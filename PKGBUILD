pkgname=chicken-srfi-64
_name=srfi-64
pkgver=1.0.5
pkgrel=1
pkgdesc='SRFI 64:"A Scheme API for test suites" implementation for Chicken Scheme'
arch=('x86_64')
license=('SRFI')
depends=("chicken")
url='http://wiki.call-cc.org/eggref/5/srfi-64'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

