pkgname=chicken-sendfile
_name=sendfile
pkgver=2.0
pkgrel=1
pkgdesc='Chicken Scheme Sending a file over the network'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-memory-mapped-files")
url='http://wiki.call-cc.org/eggref/5/sendfile'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f | xargs -I {} cp {} ${pkgdir}/usr/lib/chicken/11
}

