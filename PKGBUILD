pkgname=chicken-foreigners
_name=foreigners
pkgver=1.5
pkgrel=1
pkgdesc='Foreign helper macros for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-matchable")
url='http://wiki.call-cc.org/eggref/5/foreigners'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

