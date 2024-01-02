pkgname=chicken-records
_name=records
pkgver=1.4
pkgrel=1
pkgdesc='Procedural record-type interface for Chicken Scheme'
arch=('x86_64')
license=('Public Domain')
depends=("chicken" "chicken-srfi-1")
url='http://wiki.call-cc.org/eggref/5/records'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

