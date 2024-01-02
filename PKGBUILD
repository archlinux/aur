pkgname=chicken-r6rs-bytevectors
_name=r6rs-bytevectors
pkgver=0.1.7
pkgrel=1
pkgdesc='An implementation of r6rs bytevectors for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-utf8")
url='http://wiki.call-cc.org/eggref/5/r6rs-bytevectors'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

