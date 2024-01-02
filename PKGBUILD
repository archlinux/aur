pkgname=chicken-simple-md5
_name=simple-md5
pkgver=0.1.1
pkgrel=1
pkgdesc='Chicken Scheme Computes MD5 (RFC1321) checksums'
arch=('x86_64')
license=('Public Domain')
depends=("chicken" "chicken-memory-mapped-files" "chicken-srfi-13")
url='http://wiki.call-cc.org/eggref/5/simple-md5'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f | xargs -I {} cp {} ${pkgdir}/usr/lib/chicken/11
}

