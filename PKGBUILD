pkgname=chicken-byte-blob
_name=byte-blob
pkgver=2.3
pkgrel=1
pkgdesc='Chicken Scheme Byte array utility procedures for blobs'
arch=('x86_64')
license=('LGPL-3')
depends=("chicken" "chicken-srfi-1")
url='http://wiki.call-cc.org/eggref/5/byte-blob'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

