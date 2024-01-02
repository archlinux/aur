pkgname=chicken-srfi-34
_name=srfi-34
pkgver=0.7
pkgrel=1
pkgdesc='SRFI-34: Exception Handling for Programs for Chicken Scheme'
arch=('x86_64')
license=('SRFI')
depends=("chicken")
url='http://wiki.call-cc.org/eggref/5/srfi-34'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

