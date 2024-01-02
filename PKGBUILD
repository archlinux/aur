pkgname=chicken-srfi-143
_name=srfi-143
pkgver=0.4.1
pkgrel=1
pkgdesc='SRFI 143: Fixnums for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken")
url='http://wiki.call-cc.org/eggref/5/srfi-143'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

