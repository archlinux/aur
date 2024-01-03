pkgname=chicken-markdown-svnwiki
_name=markdown-svnwiki
pkgver=0.3.1
pkgrel=1
pkgdesc='Convert Markdown to svnwiki for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-lowdown" "chicken-sxml-transforms" "chicken-miscmacros" "chicken-srfi-1" "chicken-srfi-13" "chicken-srfi-37")
url='http://wiki.call-cc.org/eggref/5/markdown-svnwiki'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +

  install -d ${pkgdir}/usr/bin
  cp -a ${srcdir}/bin/* ${pkgdir}/usr/bin
}

