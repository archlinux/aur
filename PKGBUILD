pkgname=chicken-salmonella
_name=salmonella
pkgver=3.1.1
pkgrel=1
pkgdesc='Chicken Scheme A tool for testing eggs'
arch=('x86_64')
license=('BSD')
depends=("chicken")
url='http://wiki.call-cc.org/eggref/5/salmonella'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f | xargs -I {} cp {} ${pkgdir}/usr/lib/chicken/11

  install -d ${pkgdir}/usr/bin
  cp -a ${srcdir}/bin/* ${pkgdir}/usr/bin
}

