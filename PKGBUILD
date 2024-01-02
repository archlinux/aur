pkgname=chicken-srfi-141
_name=srfi-141
pkgver=1.0.0
pkgrel=1
pkgdesc='SRFI 141: Integer division for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken")
url='http://wiki.call-cc.org/eggref/5/srfi-141'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

