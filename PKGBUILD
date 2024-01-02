pkgname=chicken-fancypants
_name=fancypants
pkgver=0.5
pkgrel=1
pkgdesc='Automatic ASCII smart quotes and ligature handling for SXML for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-srfi-1" "chicken-srfi-13")
url='http://wiki.call-cc.org/eggref/5/fancypants'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

