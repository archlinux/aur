pkgname=chicken-tcp-server
_name=tcp-server
pkgver=1.5
pkgrel=1
pkgdesc='A simple generic multithreaded tcp-server for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-srfi-18")
url='http://wiki.call-cc.org/eggref/5/tcp-server'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

