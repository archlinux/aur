pkgname=chicken-gochan
_name=gochan
pkgver=5.2.10
pkgrel=1
pkgdesc='golang channels for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-matchable" "chicken-srfi-18" "chicken-queues")
url='http://wiki.call-cc.org/eggref/5/gochan'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

