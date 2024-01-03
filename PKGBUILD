pkgname=chicken-srfi-5
_name=srfi-5
pkgver=0.3.2
pkgrel=1
pkgdesc='SRFI-5: A compatible let form with signatures and rest arguments for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken")
url='http://wiki.call-cc.org/eggref/5/srfi-5'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

