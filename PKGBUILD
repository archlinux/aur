pkgname=chicken-svnwiki2html
_name=svnwiki2html
pkgver=0.0.2
pkgrel=1
pkgdesc='A program to convert Chicken Scheme svnwiki syntax to HTML'
arch=('x86_64')
license=('BSD')
depends=("chicken")
makedepends=("chicken-qwiki" "chicken-svnwiki-sxml" "chicken-sxml-transforms" "chicken-srfi-1" "chicken-srfi-13")
url='http://wiki.call-cc.org/eggref/5/svnwiki2html'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/bin
  cp -a ${srcdir}/bin/* ${pkgdir}/usr/bin
}

