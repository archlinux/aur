pkgname=chicken-sxml-transforms
_name=sxml-transforms
pkgver=1.4.3
pkgrel=1
pkgdesc='The SXML transformations (to XML, SXML, and HTML) from the SSAX project at Sourceforge for Chicken Scheme'
arch=('x86_64')
license=('Public Domain')
depends=("chicken" "chicken-srfi-13")
url='http://wiki.call-cc.org/eggref/5/sxml-transforms'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

