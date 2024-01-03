pkgname=chicken-srfi-160
_name=srfi-160
pkgver=0.5.3
pkgrel=1
pkgdesc='SRFI 160: Homogeneous numeric vector libraries for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-srfi-128")
url='http://wiki.call-cc.org/eggref/5/srfi-160'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

