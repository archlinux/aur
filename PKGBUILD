pkgname=chicken-srfi-174
_name=srfi-174
pkgver=1.0.2
pkgrel=1
pkgdesc='srfi-174 for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-r7rs" "chicken-srfi-19>=4.9.3")
url='http://wiki.call-cc.org/eggref/5/srfi-174'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

