pkgname=chicken-ncurses
_name=ncurses
pkgver=2.0
pkgrel=1
pkgdesc='An interface to the UNIX ncurses package for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "ncurses")
url='http://wiki.call-cc.org/eggref/5/ncurses'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

