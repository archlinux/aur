pkgname=chicken-srfi-146
_name=srfi-146
pkgver=0.1
pkgrel=1
pkgdesc='SRFI 146: Mappings for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-hash-trie" "chicken-srfi-1" "chicken-srfi-128" "chicken-srfi-145" "chicken-srfi-158")
url='http://wiki.call-cc.org/eggref/5/srfi-146'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

