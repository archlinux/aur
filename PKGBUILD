pkgname=chicken-srfi-111
_name=srfi-111
pkgver=0.5
pkgrel=1
pkgdesc='SRFI-111: Boxes for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-box>=3.6.0")
url='http://wiki.call-cc.org/eggref/5/srfi-111'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

