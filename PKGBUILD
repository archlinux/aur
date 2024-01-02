pkgname=chicken-matchable
_name=matchable
pkgver=1.1
pkgrel=1
pkgdesc='Chicken Scheme Hygienic MATCH replacement'
arch=('x86_64')
license=('Public Domain')
depends=("chicken")
url='http://wiki.call-cc.org/eggref/5/matchable'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f | xargs -I {} cp {} ${pkgdir}/usr/lib/chicken/11
}

