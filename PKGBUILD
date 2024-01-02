pkgname=chicken-srfi-63
_name=srfi-63
pkgver=0.5
pkgrel=1
pkgdesc='Homogeneous and heterogeneous arrays for Chicken Scheme'
arch=('x86_64')
license=('Artistic')
depends=("chicken" "chicken-records")
url='http://wiki.call-cc.org/eggref/5/srfi-63'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

