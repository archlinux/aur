pkgname=chicken-srfi-173
_name=srfi-173
pkgver=0.1
pkgrel=1
pkgdesc='SRFI-173 Hooks for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken")
url='http://wiki.call-cc.org/eggref/5/srfi-173'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

