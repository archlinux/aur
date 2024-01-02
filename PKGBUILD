pkgname=chicken-packrat
_name=packrat
pkgver=1.5
pkgrel=1
pkgdesc='A packrat parsing library for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-srfi-1")
url='http://wiki.call-cc.org/eggref/5/packrat'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

