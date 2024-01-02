pkgname=chicken-srfi-38
_name=srfi-38
pkgver=0.9
pkgrel=1
pkgdesc='A Chicken version of the SRFI-38 reference implementation for Chicken Scheme'
arch=('x86_64')
license=('Public Domain')
depends=("chicken")
url='http://wiki.call-cc.org/eggref/5/srfi-38'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

