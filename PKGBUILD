pkgname=chicken-base64
_name=base64
pkgver=1.0
pkgrel=1
pkgdesc='Encoding and decoding of base64 strings for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-srfi-13")
url='http://wiki.call-cc.org/eggref/5/base64'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

