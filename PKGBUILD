pkgname=chicken-srfi-25
_name=srfi-25
pkgver=1.3
pkgrel=1
pkgdesc='Multidimensional arrays for Chicken Scheme'
arch=('x86_64')
license=('SRFI')
depends=("chicken")
url='http://wiki.call-cc.org/eggref/5/srfi-25'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

